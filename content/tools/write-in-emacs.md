+++
title = "Write in Emacs"
author = ["Eason Zhang"]
date = 2018-02-20T22:13:00+08:00
lastmod = 2018-02-21T09:18:00+08:00
tags = ["tools"]
categories = ["Emacs"]
draft = false
summary = "Write an article in Emacs"
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

## Table of Contents

- <span class="section-num">1</span> [writing a book in Emacs](#writing-a-book-in-emacs)
- <span class="section-num">2</span> [Extensions that facilitate writing](#extensions-that-facilitate-writing)
    - <span class="section-num">2.1</span> [Working Environment](#working-environment)
    - <span class="section-num">2.2</span> [Org](#org)
    - <span class="section-num">2.3</span> [Spell Checking](#spell-checking)
    - <span class="section-num">2.4</span> [Moving around](#moving-around)
    - <span class="section-num">2.5</span> [count words](#count-words)
- <span class="section-num">3</span> [Reference](#reference)
</div>
<!--endtoc-->


## <span class="section-num">1</span> writing a book in Emacs {#writing-a-book-in-emacs}



I am not going to preach the powerful tool, Org. In this post, I want
to write something on the tools which facilitate the literature
writing. Indeed, if I am going to write a book someday (when time is
not a problem), the very tool I will adopt definitely is Emacs.

With high probability, I will adopt the [workflow like Mickey Petersen
did](https://www.masteringemacs.org/article/how-to-write-a-book-in-emacs). Also, Emacs has many extensions that make writing a book or an
article in large size possible. In general, I will write it in Org
mode, and export the book to other format with just a `C-c C-e`, which
is a convenient shortcut memorized by my muscle.


## <span class="section-num">2</span> Extensions that facilitate writing {#extensions-that-facilitate-writing}




### <span class="section-num">2.1</span> Working Environment {#working-environment}

My working Environment is listed as below:

1.  Windows 10 on Surface Pro 4;
2.  Emacs 25.0.5;
3.  Org 9.1.6;
4.  Also, I use spacemacs, a comprehensive configuration with many
    functions organized as layers.


### <span class="section-num">2.2</span> Org {#org}



The Org mode, the killer extension, makes Emacs great again. I surely
did quite a few customization on Org. However, I use the org layer
shipped with spacemacs.

Also, you can [configure Org like a word processor](http://www.howardism.org/Technical/Emacs/orgmode-wordprocessor.html). Org-bullet package
make Org mode beautiful. I set Org bullets as:

```lisp
(setq org-bullets-bullet-list '("✿" "❀" "♣" "♧" ))
```

As mentioned before, you can export your Org file using several
formats such as HTML,TeX, PDF, Markdown and so on.

I use Org writing my own blog through [ox-hugo](https://github.com/kaushalmodi/ox-hugo). Of course, I use Hugo.
Why not? Hugo is fast and disk-space-friend. Hugo also has its windows
distribution. ox-hugo export the org files as markdown files which are
supported by hugo.

I use Org to export PDF based on the latex class defined [org-article](https://github.com/emacsun/org-article)
,which is a latex class I forked from [tsdye/org-article](https://github.com/tsdye/org-article) and added the
support for Chinese characters. Org-article is a flexible latex class
and export beautiful PDF with the good-looking fonts and architecture.


### <span class="section-num">2.3</span> Spell Checking {#spell-checking}



Using flyspell, spell checking is easy. There is a layer named
spell-checking distributed with spacemacs.

I use aspell instead of ispell. So, I set:

```lisp
(setq-default ispell-program-name "C:/Aspell/bin/aspell.exe")
```

Of course, you have to install aspell and the dictionaries. I use the
[Win32 version](http://aspell.net/win32/).

Using flyspell mode, you can also insert some word into your personal
dictionary.


### <span class="section-num">2.4</span> Moving around {#moving-around}



Using Spacemacs, moving around is easy because it has almost all the
jumping shortcuts used in Vim (if you use the Vim mode in spacemacs).

On the other hand, using Org, you can jump from headline to headline
easily. Promoting and demoting a headline is also fast. You can even
change the head level of a headline using just a few keystrokes.

The `tab` key is a useful shortcut to change the face of how the Org
buffer looks like. I use the `tab` key to give me a sketch view of the
post I am working on. Furthermore, you can even use the narrow
function to restrict the buffer showing only the section of subsection
part you are working if your file is getting large and you don't want
to be distracted by other parts of your article.

Through the writing of this post, I also using the commands moving
around sentences and paragraphs often.

<a id="org0edb567"></a>

<div class="table-caption">
  <span class="table-number">Table 1:</span>
  move around in Org files
</div>

| commands  | description                              |
|-----------|------------------------------------------|
| `h,j,k,l` | the basic Vim keys, need no description  |
| `0`       | goto the beginning of a line             |
| `$`       | goto the end of a line                   |
| `M-a`     | goto the beginning of a sentence         |
| `M-e`     | goto the end of a sentence               |
| `M-k`     | move a paragraph up                      |
| `M-j`     | move a paragraph down                    |
| `M-{`     | goto the beginning of previous paragraph |
| `M-}`     | goto the beginning of next paragraph     |


### <span class="section-num">2.5</span> count words {#count-words}



`count-words` is a command built in Emacs. There is a github
repository ["advance words count"](https://github.com/LdBeth/advance-words-count.el) which helps count the CJK word. If
you write in CJK language, it will be handy.


## <span class="section-num">3</span> Reference {#reference}



1.  [how-to-write-a-book-in-emacs](https://www.masteringemacs.org/article/how-to-write-a-book-in-emacs)
