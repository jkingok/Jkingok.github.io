---
layout: post
date: 2025-09-21 21:10:17 +0800
title: "Let’s give Shortcuts a try"
category: diary
image: /assets/img/posts/2025-09-21-let-s-give-shortcuts-a-try.png
---

I have come up with an automation. Let’s see how this goes.  
  
It seems that you can import Markdown into Notes. However Notes has some restrictions:  
1. The first line is always a title and implies the file name  
2. Therefore the triple-dash of the front matter confuses it, plus it autocorrects the dashes  
  
Yeah so import content but not fully fledged posts. So instead I now have a Modify Markdown Shortcut which adds in the metadata at the end.  
  
The script which takes a file or folder as input (depending on whether your Note has attachments will determine this) removes the first line, uses it for the title, asks some questions relevant to my blog (category, draft, image, etc) and then sticks the front matter onto a temporary file and sends it onwards to Working Copy for publishing.  
  
**Note that this absolutely a work in progress and you and I both will have to change this to suit our needs.**  
  
I would share the shortcut but for the fact that it encodes some Working Copy info in it so I’m not sure how that would work… so instead here’s a graphic representation. *The next blog post will explain how I made this.*  

![Shortcut Source Code](/assets/img/posts/2025-09-21-let-s-give-shortcuts-a-try/Picsew1.jpg)

PS. I tried to get iSH to install Jekyll for preview. This wasn’t that effective. I think I’ll get my homelab (details to come) to fit that previewing niche.  
  
🤞  