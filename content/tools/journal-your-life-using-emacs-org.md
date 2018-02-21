+++
title = "Journal your life Using Emacs Org"
author = ["Eason Zhang"]
date = 2018-02-20T22:21:00+08:00
lastmod = 2018-02-21T09:18:00+08:00
tags = ["tools", "journal"]
categories = ["Emacs"]
draft = false
summary = "journal your work"
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
- <span class="section-num">2</span> [Install](#install)
- <span class="section-num">3</span> [Keys](#keys)
    - <span class="section-num">3.1</span> [Global Bindings](#global-bindings)
    - <span class="section-num">3.2</span> [Major Mode Bindings](#major-mode-bindings)
    - <span class="section-num">3.3</span> [Calendar Mode Bindings](#calendar-mode-bindings)
- <span class="section-num">4</span> [After a Period](#after-a-period)
</div>
<!--endtoc-->


## <span class="section-num">1</span> Introduction {#introduction}

<span class="timestamp-wrapper"><span class="timestamp">[2018-02-21 Wed 07:48]</span></span>
Long time ago, I read a post about [taking daily journal using Emacs](https://www.emacswiki.org/emacs/PersonalDiary).
Until recently, I realized that I need to take journals on my work.
So I read the post again and integrate the configuration into my
.spacemacs.d.

Here, I am not going to preach why you should keep a daily
journal. Google will tell you more.


## <span class="section-num">2</span> Install {#install}



If you want to Install the org-journal layer, just clone my
[.spacemacs.d](https://github.com/emacsun/.spacemacs.d) there is a layer named `zcljournal`, which is forked
from [spacemacs-journal](https://github.com/borgnix/spacemacs-journal) with a little modified.

To use this journal system, you need set `org-journal-dir`:

```lisp
(setq org-journal-dir "~/.spacemacs.d/journal/")
```


## <span class="section-num">3</span> Keys {#keys}




### <span class="section-num">3.1</span> Global Bindings {#global-bindings}

| Key Binding | Description                                      |
|-------------|--------------------------------------------------|
| `SPC a j j` | new journal entry                                |
| `SPC a j v` | view journal of today                            |
| `SPC a j s` | search journals within a specified time interval |
| `SPC a j S` | search all journal for a string                  |


### <span class="section-num">3.2</span> Major Mode Bindings {#major-mode-bindings}

| Key Binding | Description                     |
|-------------|---------------------------------|
| `SPC m j j` | new journal entry               |
| `SPC m j n` | next journal file               |
| `SPC m j p` | previous journal file           |
| `SPC m j s` | search the current journal file |
| `SPC m j v` | read journal entry              |
| `SPC m j V` | display journal entry           |
| `SPC m j S` | search all journals             |
| `SPC m j w` | search calendar week            |
| `SPC m j m` | search calendar month           |
| `SPC m j y` | search calendar year            |

Also, you can replace the prefix `SPC m` with `,` which is more
handy.


### <span class="section-num">3.3</span> Calendar Mode Bindings {#calendar-mode-bindings}

| Key Binding | Description                                |
|-------------|--------------------------------------------|
| `J j`       | new journal entry                          |
| `J v`       | view an entry in a new buffer              |
| `J V`       | view an entry but do not switch to it      |
| `J n`       | go to next day with journal entries        |
| `J p`       | go to previous day with journal entries    |
| `J S`       | search in all entries of all time          |
| `J w`       | search in all entries of the current week  |
| `J m`       | search in all entries of the current month |
| `J y`       | search in all entries of the current year  |


## <span class="section-num">4</span> After a Period {#after-a-period}



After a Period, say a month, there are quite a lot journals under
the `org-journal-dir` . One day One journal.
