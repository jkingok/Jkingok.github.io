---
layout: post
date: 2026-11-05 09:54:37 +0800
title: The new MyPyStub is probably too much
categories:
- diary
image: assets/img/posts/2026-11-05-the-new-mypystub-is-probably-too-much.png
---

I *found the kitchen sink, or rather Claude has…*  
  
I have spent literally a full week of **Claude Pro** credit on playing with the *MyPyStub* app I was developing and it now feels **very** real and somewhat “professional”.  
  
Arguably though I am both the creator and the designer so I am biased.  
  
It’s quite engaging leaving *Claude* (and yes you have to leave it, if you turn it to *low and slow* mode, also if it’s grinding through some builds and testing with iOS Simulator) to take some rigidly defined issues and implement them.  
  
At this time I’m letting it check its own work, it does seem trained well toward test-driven development to the extent that it has added a test suite of over 500 tests in the last week. It has added a dozen of trivial examples. It has kept my documentation up to date and worked on my workflow including exposing changes to users and fixing my versioning (I introduced *CalVer* as my preferred method because I’m not going to imply a stable release more than a snapshot in time).  
  
So what does it actually do? Well I feel like I really have just re-implemented Pyto and other similar Pythonista-style apps in my own design *so I am well aware that Claude et al are bringing us to the era of clone apps again **and I just contributed to that problem***.  
  
I designed this app to give me a design-on-device app with Python that I could share apps through. Or as an app that students could use to do faithful Python code on the fly from an otherwise-locked-down iOS device.  
  
Those are the two objectives.  
  
What it has become is a Launcher around a Documents folder (Files app) set of Python executables. I bundle as many binary iOS-compatible wheels as I can (as identified by [https://beeware.org/mobile-wheels/](https://beeware.org/mobile-wheels/) ) because there is a PIP-like engine that allows the user to use metadata to request downloads of **Pure Python wheels** on the fly.  
  
I do not ask much of the scripts to be compatible. I’m trying to be as compliant with core Python as possible, apart from the inevitable iOS limitations. *This means we cannot support binary wheels that embed extra executables, and we cannot support anything that requires a **subprocess**, nor do I present a real terminal, so there’s no coloured or properly-spaced text, at least that’s what I have discovered so far.*  
  
So you are not going to be able to run an interactive TUI like Textual, but you can run things that require command-line arguments and environment variables, and things that use **input()** to request input (or **getpass()**), and both **stdout** and **stderr.**  
  
You’re also not going to be able to do a GUI as-is, *but* I have built a methodology (because of course I have because this is how I was developing on the device to begin with) for lightly modifying an iOS-compatible (read: simple) *Toga* app to be launched. We call that a temporary “takeover” of the single app and window, and it’s stack-based, an aware UI with a Back button can return to the Launcher.  
  
I’ve got a focus on PEP-compliance at the moment, so I made a UI which shows details about the mini-app you are about to run. This shows all of the descriptions, license information, READMEs and URLs it can find, and a preview of the source code, elegantly formatted.  
  
So how do you get mini-apps into the Launcher? Well I’m not unfair, I’m not going to make you type them in! Oh no, that wouldn’t get mass appeal (though it was okay for me, it didn’t pass the PyCon AU 2026 audience test). You can download them and move them into the Files app. **You can generate them and copy them from a chatbot.** You can AirDrop them from a friend. *You can do this with a single script file, you can do it with an archive of a Python project, you can do it with a “zipapp”. **As long as you can Copy it or Save to Files, you should be fine.***  
  
If you have a single app you like and this all gets too much for you, this is where Quick Start comes in. *Unfortunately I haven’t gotten a way to give you Home Screen icons, so this is where it’s at for now.* This function was really intended for people who wanted to replace the Launcher itself though. If you got *that far* you’re close enough to making your own apps using **Briefcase** (just got to land a couple more changes for those of you without a developer subscription though yet).  
  
***A very big thank you to Claude for exhaustively testing the latest version of the app while I wrote this blog post.***  
