+++
title = "Blogging with Emacs Org"
date = 2018-01-28T18:01:00+08:00
lastmod = 2018-01-28T22:13:00+08:00
tags = ["tools", "Emacs", "Org", "Hugo"]
categories = ["tools"]
draft = false
summary = "summary of my blog workflow"
+++

<div class="ox-hugo-toc toc">
<div></div>

## Table of Contents

- [Writing with Emacs Org publish](#writing-with-emacs-org-publish)
- [Writing with Hugo](#writing-with-hugo)
    - [architecture of the site](#architecture-of-the-site)
- [Settings for ox-hugo](#settings-for-ox-hugo)
    - [settings for each section based on ox-hugo](#settings-for-each-section-based-on-ox-hugo)
    - [settings for each article based on ox-hugo](#settings-for-each-article-based-on-ox-hugo)
</div>
<!--endtoc-->

Right Now, I use two blog systems to post articles. First, I use the Emacs
built-in Org to record my learning on math, computer and wireless
communication. For me, the built-in publishing system is obsolete (I am not
saying Org is obsolete. My life rely heavily on Org.) because I find the
second one is more interesting and flexible to config. The second one is
Hugo. Naturally, the Hugo support markdown format. However, I want to use
Emacs Org to maintain a tools consistency. Fortunately, there is [ox-hugo](https://ox-hugo.scripter.co/), a
project bridging Emacs org and Hugo markdown. Ox-hugo allows you to write
your blog using Emacs Org then publish them in the markdwon format
automatically.


## Writing with Emacs Org publish {#writing-with-emacs-org-publish}

It's easy to build a static website using [Emacs Org](https://orgmode.org/manual/Publishing.html). [Worg](https://orgmode.org/worg/), the Org-mode
community, also have comprehensive tutorials about using Org to build your
own static site. To be honest, worg should be every serious Org users'
starting point. So many Org experts contribute their summary of Org in
high-quality articles on the Worg.

In general, through Emacs Org mode, all you need is to set the variable
`org-publish-project-alist` . Of course, if you want your site beautiful,
some knowledge about CSS and JavaScript is necessary.


## Writing with Hugo {#writing-with-hugo}

Now, I moved from the Emacs built-in publishing system to Hugo because of
Hugo's efficiency and flexibility. You can build your static site in just a
few minutues. One major problem of the built-in publishing system is that
you have to wait for a long time as your site gets larger and larger. When
you have only several posts, there is no problem. However, when you have more
than one hundred posts, you want to kill yourself during waiting the
publishing.

Using Hugo, everything is easy. Post an article is at the fingure.However,
if you want to write a post, it is prioritized to finished it in the github
format markdown. For a guy who rarely use markdown and is familiar with
Emacs Org, this constraint is not human. Fortunately, [Ox-hugo](https://github.com/kaushalmodi/ox-hugo), a carefuly
crafted Org exporter backend for Hugo, is definitely worth a try. Ox-hugo
bridge the Emacs Org and Hugo and make the workflow at a fly. Even though,
Hugo supports to write the posts in Org format, Ox-hugo still is a sharp
tool which I will not give up and highly recommend it.

Especially, there is tons of themes for you. Also, you can set up your own
theme.


### architecture of the site {#architecture-of-the-site}

Using `hugo` , there is a default architecture. Using `ox-hugo` , I store
the Org file in the subdirectory `content-org` . There are several sections
for my static site such `math` , `computer` and `communication` . I store
the articles in the corresponding category. For example I will put an
article on _mathematical analysis_ in the file named `content-org/math.org`
so that after exporting, the markdown file will be put in the subdirectory
`content/math/` .

<a id="orge37fca0"></a>
{{<figure src="/tools/20180126HugoArchitecture.png" caption="architecture of Hugo project" width="400">}}


## Settings for ox-hugo {#settings-for-ox-hugo}


### settings for each section based on ox-hugo {#settings-for-each-section-based-on-ox-hugo}

As mentioned before, there are several sections for my site and I use
ox-hugo to handle articles for this sections. In the subdirectory
`content-org/` , there are several `*.org` files such as `math.org` ,
`computer.org` , `communications.org` and `tools.org` . All these `.org`
files have multiple level-1 headlines. for each level-1 headline, there is
one article. I use one-post-per-Org-subtree style preferred in the ox-hugo
[document](https://ox-hugo.scripter.co/) but one-section-per-Org-file style for each section. The
one-section-per-Org-file style is kind of like one-post-per-Org-file
mentioned in the ox-hugo [document](https://ox-hugo.scripter.co/). So I have a hybrid style.

For each section, I have to set some parameters properly so that the
articles goes to the right postion. Take `math.org` for example, the
beginning of this file is like:

```text
#+HUGO_BASE_DIR: ../
#+HUGO_SECTION: math
#+SEQ_TODO: TODO NEXT DRAFT DONE
#+FILETAGS: math
#+OPTIONS:   *:t <:nil timestamp:nil toc:t
#+HUGO_AUTO_SET_LASTMOD: t
```

1.  the first line tells `ox-hugo` the targeting directory is `../content/` .
2.  the second line tells `ox-hugo` the article goes to `../content/math` .
3.  the third line is the Org state of the article, `TODO` will render the
    article a draft while `DONE` a finished post.
4.  the fourth line will tell the Org all the headlines of this file has the
    tag `math`
5.  at the fifth line. `*:t` will toggle emphasized text. `<:nil` means the
    timestamp will not be exported. `timestamp:nil` means the creation time
    will not be exported. `toc:t` means for the articles table of content is
    generated. More settings like these will be detailed in the `Org`
    manual. (You can open the Org manual by `C-h i` ,then seclect the Org
    section.) On table of contents, ox-hugo has an [article](https://ox-hugo.scripter.co/doc/org-toc).
6.  the sixth line tells ox-hugo to export the latest time when the article
    is modified.


### settings for each article based on ox-hugo {#settings-for-each-article-based-on-ox-hugo}

I use the `org-capture` to start a article. The emacs-lisp:

```emacs-lisp
(setq org-capture-templates
      '(
        ("t" "todo" entry (file "~/zorg/Dropbox/base/zrefile.org")
         "* TODO %? :TODO: \n Added:%T\n"
         :clock-in t :clock-resume t)
        ("h" "Hugo post")
        ("hm" "Math"
         entry (file+olp "~/zorg/zcl.space/content_org/math.org" "Math")
         (function org-hugo-new-subtree-post-capture-template)
         ":math:"
         :clock-in t :clock-resume t)
        ("hc" "Computer"
         entry (file+olp "~/zorg/zcl.space/content_org/computer.org" "Computer")
         (function org-hugo-new-subtree-post-capture-template)
         :clock-in t :clock-resume t)
        ("ht" "Telecommunication"
         entry (file+olp "~/zorg/zcl.space/content_org/telecommunication.org" "Telecommunication")
         (function org-hugo-new-subtree-post-capture-template)
         :clock-in t :clock-resume t)
        ("hl" "Life"
         entry (file+olp "~/zorg/zcl.space/content_org/life.org" "Life")
         (function org-hugo-new-subtree-post-capture-template)
         :clock-in t :clock-resume t)
        ("ho" "Tools"
         entry (file+olp "~/zorg/zcl.space/content_org/tools.org" "Tools")
         (function org-hugo-new-subtree-post-capture-template)
         :clock-in t :clock-resume t)
        ))
```

From the above code, you can see that I rely heavily on ox-hugo. there is one
function named `org-hugo-new-subtree-post-capture-template` which is shown
as below:

```emacs-lisp
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
    (let* (;; http://www.holgerschurig.de/en/emacs-blog-from-org-to-hugo/
           (date (format-time-string (org-time-stamp-format  :inactive) (org-current-time)))
           (title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
                 `(
                   ,(concat "* TODO " title)
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_FILE_NAME: " fname)
                   ,(concat ":EXPORT_DATE: " date) ;Enter current date and time
                   ,(concat ":EXPORT_HUGO_CUSTOM_FRONT_MATTER+: "  ":summary \"summary\"")
                   ":END:"
                   "%?\n")          ;Place the cursor here finally
                 "\n")))
```

One more point, it is awesome to preview each article after saveing it.
Yes! you can do it according [this article](https://ox-hugo.scripter.co/doc/auto-export-on-saving).
