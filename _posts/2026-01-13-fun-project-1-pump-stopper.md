---
layout: post
title: 'Fun Project 1: Pump Stopper'
date: 2026-01-13 20:40 +0800
category: diary
image: /assets/img/posts/2026-01-13-fun-project-1-pump-stopper.png
---

This is the project I've been working on over the last few days.

# The product

My partner set me a challenge to protect our off-grid water tank contents. I figured I'd program a smart switch to prototype the solution here.

_Hypothesis:_ The pump consumes electricity as it releases water to our taps. If there were a leak, after the pump, the pump would continue running for an unusually long time. Cutting power to the pump in such a situation will prevent further leaks and force someone to come check the pipework.

_Risks:_ The control must have as few dependencies as possible. The smart switch should have **local control** and perform the decision-making itself.

_Context:_ Our Wifi is somewhat unreliable, especially with weak microcontroller Wifi, let alone the Internet being fixed wireless! So we don't want the Internet being down to stop automatically turning off the pump.

_Equipment available:_ We need a smart switch/socket that does energy monitoring. It so happens I was lucky enough to buy up _some_ (but not enough, after this project - **do contact me if you have more**) of the hackable [Arlec Grid Connect PC191HA Smart Sockets with Energy Monitoring](https://devices.esphome.io/devices/arlec-pc191ha-plug/). These come with a cloud connection (tip: use the _SmartLife_ app, not the _Grid Connect_ app) via _Tuya_, but via [tuya-cloudcutter](https://github.com/tuya-cloudcutter/tuya-cloudcutter) we can install [OpenBeken](https://github.com/openshwprojects/OpenBK7231T_App) or _ESPHome_. I started with the former.

# The journey

So I started simple. Can I detect when the pump is delivering water?

Yes. Our pump is a constant flow and draws 600W. There is noise in the values of course. Let's set a threshold and say over 300W the pump is running and under 300W, it's not.

I had an installation of _Home Assistant_ sitting dormant on my "home lab" and I used the _Tuya_ integration to get me started here. I could use _Helpers_ and an _Automation_ to get the job done of stopping the pump after 10 minutes of running. I could show the time the pump had been running (to minutes precision) on a Dashboard. All very cool.

However this does not meet all of the aims - as in, what if _Home Assistant_ goes down? It's an experimental "home lab" after all, not a "mission critical" deployment. What if the wifi goes down? My router does drop connections now and then. This is especially notable with smart devices and cameras.

So I needed _local control_. I started with wresting control away from the Internet. This is achieved by using _Local Tuya_ as the integration instead. You have to get a Tuya Developer account and jump through some hoops here, so I **do not** feel like this is sustainable.

So what I really needed to do was move away from the Tuya cloud. However I wasn't invested enough, _nor am I patient enough to wait for shipping_ to get a new plug _yet_. I am _super-lucky_ that some of the plugs in my house were _already_ hackable.

I used _Tuya Cloud-Cutter_ take my _Arlec_ (Bunnings) plug from Tuya to _OpenBeken_ (similar to _Tasmota_). I blindly chose _OpenBeken_, I could also have chosen _ESPHome_ but for now I haven't needed to try that second option.

_However_ my partner is nudging me to add more features _already_ to make it more "marketable" in the future.

# The solution

There are some unique things that I'm *very* happy with about _OpenBeken_ but it is _very quirky_. I *love* the web UI built-in (that piggy-backs off _GitHub_) and the fact that it's scriptable without rebuilding firmware. The "LittleFS" really is _little_ (kilobytes!) but is a game-changer for experimentation.

The integration via MQTT to _Home Assistant_ is **fantastic**.

I'm certain I _do not_ know enough about this firmware yet, but enough to be _dangerous_. But what can I _possibly_ break? The worst that can happen is I turn _off_ the plug.

## The pump stopping behaviour

The logic we're trying to implement is:
* If the switch is on, and we are above the energy consumption threshold then the pump is active
* While the pump is active count the number of seconds that it is continuously active
* If the pump is active for more than, say, 600 seconds (10 minutes) then turn off the switch and
wait for someone to turn it back on (physically or remotely)

This is fully autonomous. This turns out pretty straightforward to script up, and all you do is build
a series of commands in a (classic!) `autoexec.bat`, in my case:

```
// Fixes the heat by lowering WiFi power usage
PowerSave 1

// Starts the clock (needed for scheduled rules)
startDriver NTP

// 2. Set the Perth offset (UTC+8)
ntp_timeZoneOfs 8

// Starts the energy monitoring hardware
startDriver BL0937

// Enable stats: Turn on, 60s check, 5m history
SetupEnergyStats 1 60 5

// Commands

// Turns pump off
alias pumpoff setChannel 1 0

// Count time
alias timeup addChannel 10 1

// If pump is active too long turn off
alias pumpactive if $Ch10>600 then pumpoff else timeup

// If pump is inactive stop counting
alias pumpinactive if $Ch10>0 then setChannel 10 0

// Check pump
alias pumpcheck if $Ch1==1&&$Power>300 then pumpactive else pumpinactive

// Check pump once per second
addRepeatingEvent 1 -1 pumpcheck

// Summarise pump
//alias pumpstat echo "[$Ch0,$Ch10,$Power]"
```

_I've also set some settings in the web configuration, things like telling the smart switch to turn itself on after being plugged in or a power failure, so we can get water, and of course I've programmed in my wifi and _Home Assistant_ settings, but this would equally work **without** any wifi at all._

That last command is a tease. What good is something that you can't check the status of, or _optionally_ interact with remotely?

## The web interface

I used _Google Gemini_ to help me figure the scripting and a web UI, and frankly, apart from the run-of-the-mill web UI, it was perpetually confidently **wrong** about the operation of _my_ firmware in _my_ plug. So there's work to be done there, but I'm here to report that after quite the bootstrapping journey I'm (probably) done.

I'd like to share some tips that I wish I knew when I started playing with the plug:
* The plug heats up with use and your frenzied coding and logging doesn't help. Take breaks!
* You upload your custom web application to "LittleFS" and access it via the "/api/lfs/" paths - this part is known, but...
* This firmware does _not_ offer the facility to place nice button(s) on the main page to nudge people to your UI, however I have a workaround!

## Hijacking the web UI

There is a built-in link and customisation option for the "Web Application". This is intended to be the [OpenBeken Web App](https://openbekeniot.github.io/webapp/). You however *cannot* just change the web app to your
HTML page -- it assumes that it's going to find a *loader* called `startup.js` at the web location you specify.

Assuming you uploaded `index.html` to your plug, to have that be your web app, you must _also_ upload a `startup.js` with:

```javascript
location.replace(location.origin+"/api/lfs/index.html");
```

Then set _(noting that your IP of your plug **can** change!)_ the "Configure WebApp" option to `/api/lfs` (i.e. a relative link).

The **next important tip** is that you'll want to **first** make sure you can get back into the main web app. Of course all you have to do is reset the URL back to `https://openbekeniot.github.io/webapp/`, but I chose to include such a link into my own web app (of course I hid it).

To get this to work, I just cloned (via the browser developer tools) the original loader from `/app`, for me this was:

```html
<!DOCTYPE html><html><head><title>PumpStop1_OpenBeken7231T_76CC0687</title><link rel='shortcut icon' href='data:image/gif;base64,R0lGODlhEAAQALMAABEHBLT+BJxCBFgmBHx6fKxKBCQiJCIWC/ppBJSWlNTS1Pv9+0xmBDo7Oow6BNlZBCH5BAEAAAsALAAAAAAQABAAAwRzcMm5UqKYtjFalkpjEACCAITRKJrwHOV5PII3GQ/yAM+ePwYKYYYoOBwF3YEwaQCehQODcSg8AZ7EwPRwMAIBhiOHGFi2Oi9YTDYvnFAp1fq0LYY5I1LJvP14PjpBTS4wJgAzNRQhIzEoKiwfGx0fGRYfEQA7' /><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"><meta name="robots" content="none"><script>var root='https://openbekeniot.github.io/webapp/',device=window.location.origin;</script><script src='https://openbekeniot.github.io/webapp//startup.js'></script></head><body></body></html>
```

And I saved that as `origwebapp.html` and linked to that.

So now we can refine the web UI and make use of the built-in API to populate the page with data.

JSON is the key here, and while there are built-in status commands, you'll find writing your own "echo" command far more lightweight, so I did that instead. It also reduces the number of API calls required.

It's probably out of scope for this very long blog post to show the code, I don't think it's polished enough either yet (I feel a _GitHub Gist_ coming on), but to give you the idea, here's what it looks like:
![Pump Control Centre UI](/assets/img/posts/2026-01-13-fun-project-1-pump-stopper.png)

## What's next?

As noted there's more ideas.

First, a bit more interaction, but, frankly, I'll probably just defer to _Home Assistant_ for that. We need notifications to announce that an issue occurred, rather than just blocking the water. Similarly we want an easy way to bypass the cutoff if we were, say, genuinely purging the tank or filling something up. I ruled out automatically turning it back on after a time-out.

Second, I do have the LED to play with, I could send some information out that way too and/or make use of the button.

Third, move away from hardcoded values. What if we moved to a different-sized pump, or we wanted a different delay.

And lastly, generalising this to more use cases. For example, I'd love to be able fully, for safety, cut power to my e-bike chargers when I detect that they are done (rather than just based on time). A similar principle applies there.

But that is waiting for me to find more hackable smart switches. Looks like I'll have to buy "Athom" Tasmota switches now and tweak the solution a bit... anyone got any _Arlec_ switches for trade?

⌨