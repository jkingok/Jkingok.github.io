---
layout: post
date: 2026-07-19 14:50:29 +0800
title: Cross-platform is truly hard
image: assets/img/posts/2026-07-19-cross-platform-is-truly-hard.png
---
I know from my previous experience of both Java and Qt that cross-platform is hard. Combine that with APIs that change over time and spare time projects that move naturally slower and you have a recipe for... glitches!  
  
I moved over to my iPad for a play (*only **after** I felt sufficiently prepared for work tomorrow*), mainly to reset the 7-day app timer to find that the **MyPyStub **and therefore likely all of my mini-apps are more than a bit broken.  
  
The major culprit appears to be the combination of my rewrite to base my UI around *OptionContainer* and changes specific to iPadOS for "Liquid Glass".  
  
At the moment you can kind of see it working but you might need to shake the iPad in frustration first (that's literally how I discovered that forcing the refresh with an orientation change helped)!  
  
Thus I have an open issue [https://github.com/jkingok/mypystub/issues/11](https://github.com/jkingok/mypystub/issues/11) but at least I'm not the first to notice, it's already noted upstream in Toga but that's where the other factor kicks in - side-projects and hobbyist level participation.  
  
Anyway, I'm off to work to pay for[ my sponsorship of BeeWare,](https://beeware.org/membership/) I definitely wanted to get my priorities right and give credit to Python before sinking (more) money into Apple's Developer Program (with currencies the way they are, it's not cheap).  
