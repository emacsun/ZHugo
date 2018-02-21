+++
title = "Version Control Using Magit in Spacemacs"
author = ["Eason Zhang"]
date = 2018-02-20T22:14:00+08:00
lastmod = 2018-02-21T09:18:00+08:00
tags = ["tools", "Emacs", "git"]
categories = ["git", "Emacs"]
draft = false
summary = "My Use of Magit in Spacemacs"
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

## Table of Contents

- <span class="section-num">1</span> [Commit Your Changes](#commit-your-changes)
</div>
<!--endtoc-->

There is an [official layer](http://spacemacs.org/layers/+source-control/git/README.html) called [`git`](http://spacemacs.org/layers/+source-control/git/README.html)builtin spacemacs. The `git`
layer is based on `magit` . Actually, on the magit website, you can
always find what you want. This post is a summary of How I use magit
in spacemacs.

I like the magit website because of the beautiful font and pleasing
color combination. More important is the maintainor Jonas Bernoulli
who devotes his yearly efforts to coin the magit great for Emacsers.
Now, after [a successful campaign on the Kickstarter](https://www.kickstarter.com/projects/1681258897/its-magit-the-magical-git-client/posts/1988383), Jonas Bernoulli
was able to work on Magit full-time for another year, which was he'd
love to.

Lets's goto my daily use of Magit in Spacemacs. If you are not using
[Spacemacs](http://spacemacs.org/layers/+source-control/git/README.html), I highly recommend it for you.


## <span class="section-num">1</span> Commit Your Changes {#commit-your-changes}



Suppose you have already make some changes on a project version
controlled using Git, the next step is to stage the changes and then
commit the changes.

If your cursor are in the buffer of a file belonging to that project,
press `SPC g s` will bring you to the magit buffer of current project.

If your cursor are not in the buffer of a file belongint to that
project, using `SPC p p` goto the helm-projectile buffer, then move
cursor to the project, then press `M-g`, you will goto the magit
buffer of current project.

Taking my `.spacemacs.d` project for example, after some modifications
on the config, I want to commit the changes. The mentioned two ways
bring me to a magit buffer like this:

<a id="org5295721"></a>
{{< figure src="/img/tools/20180219magitbuffer1.png" caption="Figure 1: magit buffer of my .spacemacs.d" width="400" >}}

From the above buffer, it records that I have one untracted file and
two unstaged changes on two existing files. On the headlines of the
untracted files and unstaged changes, press `s` will stage all the
untracted files and unstaged changes. If you are not at the headlines,
to stage all the changes you need to press `S`. After this, the buffer
become:

<div align="center">
  <div></div>

<a id="org0ea80ea"></a>
<img src="/img/tools/20180219magitbuffer2.png" alt="20180219magitbuffer2.png" width="400" align="center" />
If you regret, press `u` to unstage the changes. If you want to
commit, just press `c`, you will get a menu.

</div>

<a id="orgd124ad0"></a>
{{< figure src="/img/tools/20180219magitbuffer3.png" caption="Figure 3: press `c`  to commit" width="400" >}}

The menu is clear for you to choose. If nothing to change, just press
`c` again, and there will a buffer pop up for you to take some notes
on this commit. Also, there is a buffer showing the diff of this
commit. If you regret at this moment, just press `C-c C-k` to abort
the commit.

<a id="org9fdf700"></a>
{{< figure src="/img/tools/20180219magitbuffer4.png" caption="Figure 4: press `c` to commit" width="400" >}}

After finishing the notes, press `C-c C-c` to finish the commit. you
are in a buffer showing the current state of the project.

<a id="org6d0c626"></a>
{{< figure src="/img/tools/20180219magitbuffer5.png" caption="Figure 5: after commit" width="400" >}}

It shows that I am ahead one commit of the remote/master. So, If you
want to push the commit to the remote/master, press `p` , a buffer
will popup for you to choose where to push.

<a id="org25db75a"></a>
{{< figure src="/img/tools/20180219magitbuffer6.png" caption="Figure 6: press `u`  to push" width="400" >}}

Press `u` to push the commit to the origin/master, and you get:

<a id="org34e0b94"></a>
{{< figure src="/img/tools/20180219magitbuffer7.png" caption="Figure 7: after pushing to the origin/master" width="400" >}}

Then a commit is finished locally and remotely.
