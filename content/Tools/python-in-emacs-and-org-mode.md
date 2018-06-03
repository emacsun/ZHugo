+++
title = "python in Emacs and Org mode"
author = ["Eason Zhang"]
summary = "summary of this post"
date = 2018-06-02T21:29:00+08:00
lastmod = 2018-06-02T21:30:00+08:00
tags = ["tools"]
draft = true
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

## Table of Contents

- <span class="section-num">1</span> [edit the source code in python mode](#edit-the-source-code-in-python-mode)
- <span class="section-num">2</span> [set the command for evaluating the python code](#set-the-command-for-evaluating-the-python-code)
- <span class="section-num">3</span> [delete the \*.elc files](#delete-the-dot-elc-files)
- <span class="section-num">4</span> [export with the result](#export-with-the-result)
- <span class="section-num">5</span> [change the systematic](#change-the-systematic)
- <span class="section-num">6</span> [install the distutils packages](#install-the-distutils-packages)
- <span class="section-num">7</span> [debug python in Emacs](#debug-python-in-emacs)

</div>
<!--endtoc-->

I write this post during reading the book _Learn Python3 the Hard Way_. This is
the first python book I read from page to page.


## <span class="section-num">1</span> edit the source code in python mode {#edit-the-source-code-in-python-mode}



In Emacs Org mode, you can insert the source code using `<s` then `<tab>` . If
you want to edit the source code, you can hit `C-c '` then you will be switched
to a buffer in python mode and all the features of python mode can be
utilitized. After finishing the modification, `, c` will save the changes and
switch you back to the Org file and `, k` will give up the changes and switch
you back to the Org file.


## <span class="section-num">2</span> set the command for evaluating the python code {#set-the-command-for-evaluating-the-python-code}

```emacs-lisp
(setq org-babel-python-command "python3")
```


## <span class="section-num">3</span> delete the \*.elc files {#delete-the-dot-elc-files}



After org mode version 9, it is buggy to evaluate python code in Org mode and
the error message is :

```text
Evaluation of this python code is disabled
```

After some google, I find the solution at [here](https://github.com/syl20bnr/spacemacs/issues/7641) . The solution is easy: deleting
the .elc files under the .emacs.d/elpa/org-plus-contrib-XXXXXX/ directory.


## <span class="section-num">4</span> export with the result {#export-with-the-result}



Take the following code snippet for example.

{{< highlight python "linenos=table, linenostart=1" >}}
cars = 100
space_in_a_car = 4
drivers = 30
passengers = 90
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven

print("There are",cars,"cars available.")
print("There are only",drivers,"drivers avaiable.")
print("There will be", cars_not_driven,"empty cars today.")
print("We can transport",carpool_capacity,"people today.")
print("We have",passengers,"to carpool today.")
print("We need to put ablout",average_passengers_per_car,"in each car")
{{< /highlight >}}

After the above debugging and config, you can evalute the code snippet using
`C-c C-c` inside the code. and after that the result will appear below the code
as:

```text
#+RESULTS:
: There are 100 cars available.
: There are only 30 drivers avaiable.
: There will be 70 empty cars today.
: We can transport 120 people today.
: We have 90 to carpool today.
: We need to put ablout 3.0 in each car
```

However, when I call the org export dispatcher using `C-c C-e h o` . The result
part is not displayed as the code snippet does. After checking the Org manual,
there is a variable `org-export-use-babel` controing whether evaluate the code
snippet or not during exporting. Evan the variable is set to be `t`, the code is
not evaluated. To control export the code, results or both, the `:export` header
arguments should be set to `code`, `results`  or `both` .

In summary, in order to control the evaluation and export, `results` and
`export` header arguments are necessary.


## <span class="section-num">5</span> change the systematic {#change-the-systematic}



If you install several versions of Python in your system, you have to
choose one as the default.  Execute the following to set the priority list:

```shell
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 3
```

If you want to switch to a different version of Python, just execute the
following comand :

```shell
sudo update-alternatives --config python
```

Then choose the right number from the popup menu.


## <span class="section-num">6</span> install the distutils packages {#install-the-distutils-packages}



After updating the python from 3.5 to 3.6, anaconda-mode does not work. In the
minibuffer, it says:

```text
InternalError: The subprocess /usr/bin/python3.6 has crashed.
```

It takes me much time to begin to read the anaconda-mode buffer the find the
error message. what a stupid guy. The error message is

```text
<module>
    from distutils.spawn import find_executable
ModuleNotFoundError: No module named 'distutils.spawn'
```

After several google, I install the `python3-distutils` using:

```shell
sudo apt-get install python3-distutils
```

Notice that it is `python3-distutils` , not `python-distutils` .

After this, the auto-completion is live again.


## <span class="section-num">7</span> debug python in Emacs {#debug-python-in-emacs}



During working on ex23.py, I have an idea to debug python in Emacs.

I know it is `pdb` that call the python debugger. However, when I use python3.6.
I have to modify it to:

```text
python3.6 -m pdb ex23.py utf-8 strict
```

Then, I found that there is an extension [realgud](https://github.com/realgud/realgud/) , which even allows you use the
`F10` to next, `F11` to step in, `shift F11` to step out, `F5` to run/continue.
More important all the shortcuts are effective in the source code buffer, pretty
handy.

You even can you mouse to set and clear breakpoints.
