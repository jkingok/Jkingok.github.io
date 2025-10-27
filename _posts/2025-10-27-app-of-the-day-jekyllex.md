---
layout: post
title: App of the Day - JekyllEx
date: 2025-10-27 20:42 +0800
category: diary
image: /assets/img/posts/2025-09-21-app-of-the-day---it-s-just-sew-good.png
---

This new blog workflow is brought to you by _JekyllEx_ and as a result, it has to
be the App of the Day. Find it [here](https://jekyllex.xyz/) .

_JekyllEx_ is an editor and previewer for GitHub Pages-style blogs or sites like this one.

It's point of distinction is to bundle Git, Ruby and enough of an environment wrapped
up inside of an editor to keep your site going.

It is free and open source, I found it in F-Droid, and while it's not perfect it'll do.

When compared with my previous _iPhone-based_ workflow I can now **very** easily test my
blog post (couldn't do that before!) but I've lost a little on the Git side (it's command
line driven, but I'm already comfortable with that).

Besides, it's open source so I guess it's on me now to offer to fix that (something impractical
on the Apple side).

It'll be important to understand how to use it... because there were some tweaks needed.

# Getting started

Download and install `F-Droid` and then `JekyllEx`.

You will add a _GitHub_ access token for the editor on the _github.com_ site and copy it into
the editor's settings along with the clone URL for your blog. From here the _Git_ part itself
is straightforward as long as you are used to to the command line and stick to _non-interactive_
commands.

The next step is to set up the local build of your blog, and this is where things can go off the
rails (Ruby pun intended) a bit.

Run the `bundle install` command from the menu... and depending on your blog's setup it'll either
work or break.

For me it broke. This is because the `ruby` environment is limited. It cannot build native extensions, 
or dependencies of extensions. For my use of the `chirpy` theme, this was the `io-event` dependency
Of the `html-proofer` test extension.

For this problem you can disable the extension in the `Gemfile`.

I had a second problem which was there was some automation in the them that relied upon running the
`git` command, however _JekyllEx_ wasn't providing the `PATH` properly.

For this problem you need to manually add the path to the `git` command.

Both fixes can be done conditionally so that you preserve the capability to build things as-is on
_GitHub Pages_ itself.

The changes I made are [here](https://github.com/jkingok/Jkingok.github.io/commit/68e9d0813da7de89a19a21916f709577718ac21b).

Then you can use the play and stop button to run _Jekyll_ itself to preview your site.

# Tips for use

Remember that you have a full terminal, and also a full (at least) `ruby` environment so you
Can automate things as you'd hope, there's no useful UI.

For example I'm obviously going to be typing:
````
git add -A
git commit -m "New post"
git push
```
Very often. I could write a `ruby` script for this. Just remember you have to stop the preview to run commands 

There is limited file management. It helps to do your file renaming in particular (such as for your images)
in advance of importing them. (You can only rename or delete from the editor and non-text files don't open the editor.)

I'm sure I'll have more tips as we go along.

⌨️