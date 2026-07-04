---
layout: post
date: 2026-07-04 19:00:00 +0800
title: "What's keeping me busy"
category: diary
image: /assets/img/posts/2026-07-04-whats-keeping-me-busy.png
---

In one word: *work* has kept me remarkably busy.

But it's not just that.

I'm coding again. Alright for full disclosure it's _pair programming_ with *Gemini*, no I won't say it's vibe coding because I am _explicitly_ trying to learn with it and understand what oftentimes flawed code it generates.

Yes its flawed for a couple of reasons:
1. I'm on the free plans and models
2. I seek to code in some odd niches

You see I got excited a while ago and I started a project inside a Jupyter notebook that was making a DVD catalogue for myself on my iPhone. I was using Jupyter to maintain the database but then I would export it to a single HTML page that works in the Files app.

I'd set myself the constraint of having things work without having to resort to building an iPhone app.

This is a remarkably powerful paradigm, the HTML file can embed all of its resources (images) using `data` URIs, and CSS can do a lot of faux interactivity, which is necessary because Quick Look will _not_ run Javascript. And a bonus is that the file can then be AirDropped and backed up via iCloud Drive.

But of course I outgrew that. Carnets - the Jupyter engine I use on iPhone and iPad - doesn't really have an “end user” interface (I couldn‘t easily get any of the dashboarding extensions to workon it). So while it was great for a proof-of-concept of the functions, it wasn't as shareable as the output.

I’d used apps like Pythonista and Pyto in the past so I gave the latter another go. It has a set of helper UI libraries and so it got me a little further but it was still a bit fussy about how it would run them - I could create some Shortcuts but i. would drop back to the terminal and editor which is the primary function of the app, and I‘d have to pay again on my partner’s iPhone to get the Python engine. I couldn't bring myself to do that because it feels like these apps were a little unmaintained in that they were stuck on Python 3.10.

And this is around about where the watershed moment happened. In order to get out of the clutches of Pyto, I started moving my UI from it's UI engine into *Toga*.

*Toga* is the lightweight beginner-friendly cross-platform UI toolkit that belongs to the *BeeWare* suite of tools. While it doesn't have a lot of breadth on iOS, it's the limitations that make it somewhat more useful because you don‘t get overwhelmed and useful for coding _from the phone itself!_

So I figured I was going to have to try to make my own Python Launcher for my iPhone and iPad. Enter an exploration of *Briefcase*, the companion of *Toga* from which I could make a more sophisticated (read: less crashy) and up to date version.

So frugal me started by dusting off my *2012 Mac Mini* and get it up to *macOS Sonoma* so it could run and Xcode new enough.

For this I have to thank _Dortania_ and the _OpenCore Legacy Patcher_ for making this part possible.

It is the case that I can send apps after pairing over USB once via Wifi. So with the combination of Apple Screen Sharing (VNC)/Chrome Remote Desktop/SSH and WireGuard/Tailscale/Wake on LAN I can couch-code. With iCloud Drive and Git via the wonderful _Working Copy_ app I can easily couch-code, I just have to remember to update my Python Launcher _once every seven days_ - at least until I give in and pay Apple's fee (or if I want to go above 3 devices).

_The only reason I am giving myself the time to do this write-up is because I am away from home and I forgot to refresh the seven days on my app!_

My Mac is absolutely inadequate for the iPhone simulator, unsurprisingly given its vintage, so I did have a look at my options. I'm kicking myself for not being impulsive for once because the Great Price Hike of 2026 happened, admittedly there was already a one month wait on Minis but I could have just gotten a Neo instead. The used market isn't much better either.

But I'm working around that because I'm actually not rebuilding my launcher much at all! It has a hot reload hook that allows me to replace all of the code with code in the Files app. That wouldn't work in the App Store but I don't care about that!

And now the _next_ problem... I now have _too many_ ideas that I want to try!

After first polishing the launcher I am now "professionalising" my media database and trying to derive some patterns for myself.

I have set up the Google Antigravity CLI on my Mac Mini if I aspire to agenticallg co-develop but I haven't gotten there yet. Maybe I won't...

One of my apps is location-based. I was drawn to making it an iPhone app because there was _no way_ I was going to go to a paid API. If I embed the usage in an app, then Apple Maps usage should be completely free.

So I looked up *Toga*'s `MapView` and I fell over when I saw the _example_ i  the documentation was for _Perth, Australia_.

Well that little easter egg made it all the more fun for me. A technology that knows I exist.

Then on an impulse I remembered there are regular meetups for Python here. In a creepy bit of synergy this week I looked up [Python WA](https://pythonwa.com) and it was meeting-week (monthly)... and a topic was *Briefcase*.

With apologies to Russell for going _full fanboy_ (I mean it's the same week as _Supanova_ in Perth and _#savestargate_ so it's at least on theme) I made a "beeline" for the city and hung out for a couple of hours and collected an awesome and bonus BeeWare pin and stickers.

The best part of the presentation for me was a reminder that I was _bumbling_ around trying to figure things out when there actually is a suite of test case/examples sitting there in Git. I think the reason I'd ignored them was because the demo launcher didn't run directly in iOS. I've put that in my queue to fix that because showcase/example apps are terribly useful.

![Join BeeWare](assets/img/posts/2026-07-04-beeware-join.jpg)

Speaking of _bumbling_ I have started to push past *Toga* into *Rubicon* which is how we dive deeper into the Apple APIs - I can see that works now _as long as, and this is important, you switch the Apple Documentation back to the past into Objective-C and not Swift_, because the APIs are no longer the same!

I'm thinking of usage of *BeeWare* that could be useful at work in education because as I noted, with the right boilerplate it feels pretty accessible to beginners and really opens up the run-anywhere potential.

But in truth I really just want more time to use it at home. Maybe I'll join _Discord_ - there really isn't a reason _not to_ any more.

My GitHub has me developing things in plain sight - my [Python Launcher](https://github.com/jkingok/mypystub) if you're curious. I'd like to push this out via _TestFlight_ at some point. I guarantee that in this form it can't go into the _App Store_ but the finished apps could.

I do have a Pixel 7 and a dormant Google Play Developer account so I will get curious to publish it there. I am also curious to publish the web app versions into my (this) web page - I do love single page Progressive Web Apps after all (it was what I thought I had to code to for couch-coding, but I am glad to have Python back).

I have also been following _Textual_ and I _think_ that's where the Terminal CLI version of *Toga* is headed and so making things for SSH would also be very interesting.

The next few months will be interesting and could be quite sleepless!
⏰