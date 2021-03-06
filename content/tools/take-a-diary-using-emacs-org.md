+++
title = "Take a Diary Using Emacs Org"
author = ["Eason Zhang"]
date = 2018-02-25T19:47:00+08:00
lastmod = 2018-03-04T09:34:00+08:00
tags = ["tools", "Org", "diary"]
categories = ["Emacs"]
draft = false
summary = "keep a diary using Emacs Org"
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

## Table of Contents

- <span class="section-num">1</span> [Introduction](#introduction)
- <span class="section-num">2</span> [Set up](#set-up)

</div>
<!--endtoc-->


## <span class="section-num">1</span> Introduction {#introduction}



There is one diary system built in Emacs. When you are in the
Calendar buffer, press `i` will bring you a menu to select what
kind of diary you want to take. However, as a loyal fan of Emacs
Org, I want to take diary using Org.

When I am in the org agenda buffer, press `i` will bring me a menu
like what show in the calendar buffer after pressing `i`.


## <span class="section-num">2</span> Set up {#set-up}



It seems that all you need to do is set the `org-agenda-diary-file`,
  so that Org knows where to put the diary file.

```lisp
(setq org-agenda-diary-file  "~/zorg/Dropbox/base/zdiary.org")
```

After this, everything is left for Org mode. All you have to do
is writing your diary.
