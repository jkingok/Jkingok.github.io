---
layout: post
date: 2026-08-09 12:20:50 +0800
title: Working on my workflow
image: assets/img/posts/2026-08-09-working-on-my-workflow.png
---
It was a rainy Saturday. That freed me up for some sneaky coding.  
  
Unfortunately things went the way they usually do at this stage of projects and there wasn't much visible change to be seen.  
  
That's because I chose to work on my workflow, and knowing that I wanted to get to a more significant release of something (yes the *Liveability* source code isn't on GitHub yet) meant I should get more serious rather than playful with my coding.  
  
So I started adding tooling in. Some speed you up, some are an awful migration with the payoff from the investment coming later.  
  
One thing I will say about the Python ecosystem - I am a bit disappointed how we've turned a lot of tools into APIs or wrappers over native code. With me in a primarily pure-Python environment - as far as I remain ad hoc developing on-the-fly out of a Documents folder - I cannot adopt anything that needs compiling nor have I integrated BeeWare's iOS packages, nor are there many iOS wheels yet.  
  
So I went down a few blind alleys (thanks Gemini, but perhaps some *used to be* pure Python?).  
  
I'm happy with **black**, **pyflakes **and **pycodestyle**. But beyond that, and this means typing like **mypy**, I'm going to be forking myself into an on- and off-phone workflow.  
  
Already though running a few basic tools *before* re-running my prototypes will save me dozens of back-and-forths if I miss a : or something equally hard to see at night on a phone screen.  
  
I'll use my experience with branches and pull requests and I will have to get to know GitHub Actions. *All knowledge I'd avoided in my previous workplace.*  
  
Because of that I have, it was inevitable, pushed the button on the (somewhat expensive but oh well) Apple Developer Subscription.  
  
On typing in Python - I love it, but don't expect to able to reach perfection - you are going to have to give up and flag some ignores. There's a couple in *Toga* (that I should discuss or report) that could have sent me over the edge. It is really helpful though - it has pointed out some things that did/would cause issues only at runtime like Coroutines where there should be a task, but other things like me using toga.App.app as a global dictionary was very much angering the tools!  
  
I have also started writing some test scripts, because my script engine is so elegant now, perhaps I'll be able to run them on device? Not sure yet, still investigating but manual ones definitely work.  
  
I also have flagged that I need to get commit language, versioning and documentation standardised (I still have aspirations to make a *togax-ios* library) however a lot of those tools are looking for a subprocess out to Git (hello forking for dulwich and/or delegation to Working Copy).  
  
Let alone all of the app features.  
  
Bring on the agents - I already started using some AI auto-complete in VS Code, but I do find it a bit awkward, have to get the keyboard shortcuts sorted because it does confuse me when it suddenly pops up in the middle of when *I know what I want I am just too slow to type it*.  
  
I'll probably have to retire/go freelance before I have time for all this (and yes I still don't want to forget Android either...).  
  
Next "upgrade" is probably Google AI Pro (pretty much only because of vendor lock-in, thanks YouTube and oodles of Drive storage in the offer)...  
  
Who put the F in FOSS again?  
💰  
