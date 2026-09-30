---
layout: post
date: 2026-09-30 11:01:28 +0800
title: Using unborn bees
categories: diary
image: assets/img/posts/2026-09-30-using-unborn-bees.png
---
Here's a tip for anyone like me that is straddling two camps:  
- working on the upstream Beeware codebases  
- wanting to use them within separate external apps  
  
Tip 1 is pretty obvious in the Python ironically Rust world and that is to adopt *uv*. So first install that.  
  
Then you'll be able to use it to ensure you get the latest *briefcase*.  
  
```
uvx --from git+https://github.com/beeware/briefcase.git briefcase

```
  
instead of running *briefcase* (set a shell alias).  
  
Lastly if you are also relying upon unreleased versions of *Toga* too you can edit your *pyproject.toml*.  
  
For the platforms that you need/care about you'll want to not rely on versioned *toga*, you'll also want to put in subdirectoried Git URLs like  
  
```
toga_iOS @ git+https://github.com/beeware/toga.git#subdirectory=iOS

```
  
Also make sure if you are trying to track changes make the build take a little longer - you might suffer confusion if caching gets involved - use the "*-u -r*" arguments at least to keep things updated.  
  
And remember though there is a reason for a release process! If you can wait, you should.  
🐌  
