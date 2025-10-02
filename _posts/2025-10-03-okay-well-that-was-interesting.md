---
layout: post
date: 2025-10-03 07:58:57 +0800
title: "Okay well that was interesting"
category: diary
image: /assets/img/posts/2025-10-03-okay-well-that-was-interesting.png
---

So upon the stern direction of *Canva* and the presentation at DDD Perth 2025 which strongly asserted that legacy developers like me need to get over themselves (or their current employers) and embrace, or at least develop an appreciation for AI coding, I did it.  
  
Please don’t call me a *vibe coder*, and I’ll explain why.  
  
1. I genuinely did switch out of the prompt development phase quite quickly.  
2. I intentionally asked for languages that I understand and would be able to edit myself, and have done so since.  
  
### The idea  
I do regularly lose track of the fortnightly cycle of our rubbish bins between my regular and holiday home.  
  
Inspired by a recent post [on HackerNews ](https://news.ycombinator.com/item?id=45437326)that reminded me that we’re back into an era of mobile-first development, I aimed to develop this tracker as a single-page no-build PWA compatible with my iOS, iPadOS devices.  
  
### The systems  
I’m not too invested in AI in general (the images on this blog being the exception):  
* I’m using a free Google Gemini account  
* I do have a Microsoft 365 account with Copilot, but not Copilot Pro  
* What’s ChatGPT?  
  
So I went with the free models on GitHub Copilot for this experiment. I do believe that will have influenced my experience dramatically from what I read, because it was impressive, but not mindblowing.  
  
PS. Overnight Google announced *Jules. *This has not been reviewed yet. Maybe there’s some free access there too…  
  
### The observations  
While GitHub Copilot was conversationally useful, it did make mistakes.  
  
On the positive side:  
* It understood my design and requested technology choices  
* It scaffolded out enough of the repository  
* It retained context as we built up the initial version  
* It has the ability to do some actions *with my approval every time*  
  
On the less positive side:  
* It hallucinated a newer version of the Bulma CSS library than has ever existed, which meant the resulting code was unstyled.  
* It wasn’t actually able to build the GitHub repository properly. It is (by design?) barred from Creating repositories, but it can modify them (given it was asking explicit permission I don’t see why not).  
* When it did push it just pushed placeholder files missing content, so I reverted to copy and paste, and once I’d told it so, it stopped offering to try again.  
* There were some logic errors in the generated code - when I tried to edit things in the UI it would keep reverting to the default state. This made me think the geolocation was broken, a good thing is that I can easily generate stub example files via Copilot for testing narrow slices of API.  
* It also butchered the styling trying to do it half manually and half with Bulma which messed up dark mode.  
  
So I can see where this is all headed, and in well trodden domains where the models have masses of data (but unless I’m misunderstanding something, shouldn’t there be a GitHub-trained model - but maybe that’s not free.  
  
### The testing and deployment  
Being a web app I started experimenting with how to test this on my iPad, and I started the dumb way, just posting it via GitHub Pages to a hidden folder on this blog, and that works, especially with GitHub Pages refreshing on every push by the GitHub.dev (VS Code for the Web) editor, though there are delays. I have since moved to the better, again, **[Working Copy app](https://workingcopyapp.com) **way which enables local editing and previewing, given I’m using no-build frameworks this is all good. (A brick bat for the Microsoft apps including GitHub - it doesn’t appear GitHub Copilot is in or has its own app. It probably could/should be a PWA.)  
  
I did try some other apps (I didn’t feel like pulling out the Chromebook tonight) that promised to do web dev on the iPad better. One felt a bit immature, but granted, it was the free option, the other was paid (and came “recommended” by Microsoft 365 Copilot), but unfortunately I’m concerned it feels unmaintained, however it is how I originally figured the Bulma issue so that’s not all bad, so no *new* app to recommend this week, but, note to self: let’s give Working Copy an award…  
  
### The result  
The prototype for those who are curious is operational at [https://blog.jking.id.au/copilot-bin-collection-tracker-pwa/](https://blog.jking.id.au/copilot-bin-collection-tracker-pwa/), no data is collected, it lives only in your browser.  
  
I’m likely to revise it. Manually at first. It is exciting having a way to get things onto my iPhone (or those of others), because I don’t enjoy builds tethered to my Mac - I’m far too opportunistic and mobile. Right now I’m on my morning walk for example…  
  
🥾  