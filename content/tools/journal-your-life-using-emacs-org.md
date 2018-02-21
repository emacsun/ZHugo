+++
title = "Journal your life Using Emacs Org"
author = ["Eason Zhang"]
date = 2018-02-20T22:21:00+08:00
lastmod = 2018-02-21T10:21:00+08:00
tags = ["tools", "journal"]
categories = ["Emacs"]
draft = false
summary = "journal your work using Emacs Org"
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
- <span class="section-num">4</span> [Take a Journal](#take-a-journal)
- <span class="section-num">5</span> [Browse Your Journal](#browse-your-journal)
- <span class="section-num">6</span> [Search Your Journal](#search-your-journal)
- <span class="section-num">7</span> [After a Period](#after-a-period)
</div>
<!--endtoc-->


## <span class="section-num">1</span> Introduction {#introduction}



Long time ago, I read a post about [taking daily journal using Emacs](https://www.emacswiki.org/emacs/PersonalDiary).
Until recently, I realized that I need to take journals on my work.
So I read the post again and integrate the configuration into my
.spacemacs.d.

In general, I use this journal system to note down my work. This
journal system is simple and easy to use and maintain.

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


## <span class="section-num">4</span> Take a Journal {#take-a-journal}



After setting, you can take journal anywhere and anytime. In the
buffer not in `Org` mode, `SPC a j j` will generate and new
journal entry. In `Org` mode, `SPC m j j` or `, j j` will also
bring a new journal entry.


## <span class="section-num">5</span> Browse Your Journal {#browse-your-journal}



To browse your journal, you'd better in the Calendar buffer using
`calendar` which I bind to `SPC o C` . In this buffer, press `J`
there will be a menu popping up for you.
![](/img/tools/20180221orgjournal.png)

As you can see, the day with a journal is highlighted in yellow (
you can custom it to other colors ).

| keys  | description                           |
|-------|---------------------------------------|
| `J n` | jump to next day having a journal     |
| `J p` | jump to previous day having a journal |
| `J v` | display journal of current day        |


## <span class="section-num">6</span> Search Your Journal {#search-your-journal}



The key I use most is `org-journal-search-forever` which I bind to
`SPC a j S` and you can search all your journals anytime and
anywhere. You can also search a certain period by `SPC a j s`
with which you need to enter the begin and end of the period in
the minibuffer.

There are other search options which allow you search in a week,
month and a year. However, to search your journal in a week, a
month and a year, you need in the Calendar buffer.


## <span class="section-num">7</span> After a Period {#after-a-period}



After a Period, say a month, there are quite a lot journals under
the `org-journal-dir` . One day One journal.
