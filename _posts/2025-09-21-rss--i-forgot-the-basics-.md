---
layout: post
date: 2025-09-21 20:52:35 +0800
title: "RSS: I forgot the basics!"
category: diary
image: /assets/img/posts/2025-09-21-rss-i-forgot-the-basics.jpg
---

At least for me, as a Google Reeder refugee (thank you [Reeder app](https://www.reederapp.com)), a blog without RSS cannot be called a blog at all.  
  
A note that your average GitHub Pages blog might not automatically get an RSS feed depending on whose template you follow. I think the switch to Chirpy let me down here.  
  
Anyway it’s fixed now, as is my vanity domain name. Find this blog at [Blog.jking.id.au ](https://blog.jking.id.au)and the feed [here.](https://blog.jking.id.au/feed.xml)  
  
Shortly I’ll add it into the site template so feed readers can detect it too.  
  
**Update:** I thought I'd fixed this properly but I hadn't. Contrary to my previous suggestion you don't need to add `jekyll-feed`, in fact it'll conflict. But you probably
want the extra `meta` tag nonetheless. For *Chirpy* a way of doing this is to add in an `_includes/metadata-hook.html` with

```html
<link rel="alternate" href="https://blog.jking.id.au/feed.xml" type="application/rss+xml" />
```

You’re welcome.  
🛠️  
