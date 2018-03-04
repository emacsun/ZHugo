+++
title = "Extends Emacs Org Mode on iOS Device"
author = ["Eason Zhang"]
date = 2018-03-04T09:31:00+08:00
lastmod = 2018-03-04T09:34:00+08:00
tags = ["tools", "Org"]
categories = ["Emacs"]
draft = false
summary = "Extends the swiss army knife from PC to movile device."
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

## Table of Contents

- <span class="section-num">1</span> [BeOrg](#beorg)
- <span class="section-num">2</span> [Drafts](#drafts)
- <span class="section-num">3</span> [Dropbox](#dropbox)

</div>
<!--endtoc-->

I use two APPs [BeOrg](https://itunes.apple.com/us/app/beorg/id1238649962?mt=8) and [Drafts](https://itunes.apple.com/us/app/drafts-quick-capture/id905337691?mt=8) as Org's extension on my iOS device.
Oh, almost foget it. Another one: dropbox. Beorg and Drafts stores the
captures of ideas into dropbox. I retrive them when I am home on
Windows 10 using my Surface Pro.

The relationship among all the APPs I mentioned above is like

<a id="org719fbfe"></a>

{{< figure src="/img/tools/20180225orgmobile.png" caption="Figure 1: My using of Org mode through mobile device" width="600" >}}

Actually, I also tried another APP named MobileOrg, but dislike it
because of its inflexibility ,boring GUI and hard-to-config. The
combination of Beorg and Drafts works well for me with their playing
each's own role.


## <span class="section-num">1</span> BeOrg {#beorg}



Using BeOrg, I only capture a TODO. I leave capturing a note to Drafts
which is good at notes.

One screenshot of Beorg is shown as:

{{< figure src="/img/tools/20180225beorg.png" >}}

The green button is used to add a todo capture. As you can see, Beorg
can also read the todos from your iOS calendar (I am sorry for whom
cannot read Chinese. That item in Chinese comes from iOS calendar
reminding me to pick up the magazines and newspaper).

By default, Beorg display the week agenda. The TODO states are also
can be customized. I set the file synchronization method as dropbox
and set the org directory which is shared with Drafts and my windows.
So I can keep the org files consistent.

Beorg also has an option for quick capture. Naturally, I also set it
as the inbox of my Org mode on Drafts and Windows. You can also
control the vivibility of your iOS calendars, i.e. which part shoule
be integrated into BeOrg agenda view, the family? personal? work? You
name it, as you wish.


## <span class="section-num">2</span> Drafts {#drafts}



Drafts is the most efficient tool for taking a note. All you need is
to focus on writing. Furthermore, you can even export your notes to
way many other APPs such as evernote, markdown, oneDrive, google drive
and so on. There are tons of commands available on the [action
directory of Drafts](http://drafts4-actions.agiletortoise.com/).

Combined with dropbox, I config several commands of my own. One
screenshot is like:

{{< figure src="/img/tools/20180225drafts.png" >}}

Take my command `Drafts TODO BeOrg` for example, the step is append
files on Dropbox and the content is shown as:

```text
 * TODO  [[title]]
SCHEDULED: <[[created|%Y-%m-%d %a]]>
[[body]]
```

Notice that, I set the format of creating timestamp the same as Emacs
Org so that Emacs Org can follow the todo from Drafts.

Of course, you can define your own command in Drafts just read the document.


## <span class="section-num">3</span> Dropbox {#dropbox}



The configuration of Dropbox is easy. All you have todo is to put the
org files in a directory where Beorg, Drafts and Windows knows.
