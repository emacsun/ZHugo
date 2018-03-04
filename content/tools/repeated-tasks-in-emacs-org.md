+++
title = "Repeated Tasks in Emacs Org"
author = ["Eason Zhang"]
date = 2018-03-04T09:32:00+08:00
lastmod = 2018-03-04T09:41:00+08:00
tags = ["tools", "Org"]
categories = ["Emacs", "tools"]
draft = false
summary = "set deadline or scheculed date for a repeated task in Emacs Org"
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

## Table of Contents

- <span class="section-num">1</span> [Repeater in Org](#repeater-in-org)
- <span class="section-num">2</span> [a special repeater](#a-special-repeater)
- <span class="section-num">3</span> [the `.+` repeater](#the-dot-repeater)
- <span class="section-num">4</span> [repeated period](#repeated-period)

</div>
<!--endtoc-->

Timestamps in Emacs Org are easy. Setting timestamps for repeated
tasks are more interesting. It is quite often in daily life that some
tasks will be repeated day by day, such as having lunch and afternoon
nap, taking exercise. Org has a repeater in a task with a deadline or
scheduled.


## <span class="section-num">1</span> Repeater in Org {#repeater-in-org}

```text
**TODO take a noon nap
DEADLINE:<2018-03-04 Sun 12:30 +1d>
```

`+1d` is a time repeater. The task `take a noon nap` is intened to be done
every day at 12:30. The interesting part is that everytime the state
of the task is changed from TODO to DONE. The task will be changed to
TODO again with the timestamp changed for the next day automatically.
For the user, you will never see the DONE state. The task with a
repeater is always in TODO state.

The `d` in `+1d` means day. In a straightforward way, it can be `h`  for
an hour, `w` for a week, `m` for a month, `y` for a year.

Deadlines and scheduled items generate an agenda item. If you want to
be warned before a period you can add a warning period in the
timestamp.

```text
**TODO take a noon nap
DEADLINE:<2018-03-04 Sun 12:30 +1d -10m>
```

`-3h` means that the task will appear ten minutes before 12:30.  For a
traditional task with a TODO having a deadline or scheduled time, once
it was done, the item will disappear from the agenda. However, for a
task with a repeater, Org will increase the date of the timestamp by
the interval indicated by the repeater then set the task to TODO state
immediately. The task will appear in all the agenda from the timestamp
on.


## <span class="section-num">2</span> a special repeater {#a-special-repeater}



For `+1d` the repeater will always adding one day every time you change
the task from TODO to DONE. However, for the task like taking a nap,
having a deadline at 2018-03-04, if you forget to change it from TODO
to DONE on 2018-03-04 and you do this on 2018-03-05, The timestamp
will not change to 2018-03-06. It will be 2018-03-05, this is werid
because you have already done the task on 2018-03-05. You have to
chage the task from TODO to DONE again so that the deadline timestamp
will be 2018-03-06.

For the scenario mentioned above, Org has repeaters with a special
format `++`  and `.+` .

```text
**TODO take a noon nap
DEADLINE:<2018-03-04 Sun 12:30 ++1d>
```

With `++1d` the deadline of a repeated task will always be tomorrow
everytime you change the state from TODO to DONE even you forget to
finish it several times.

Actually, this kind of task is quite common in daily life. Taking
calling your father weakly for example, if you forget to call him
three weeks, it is impossible to call him three times in a week to
make things up.


## <span class="section-num">3</span> the `.+` repeater {#the-dot-repeater}



Similar with `++` , `.+` will shift the date to the future after **today** .
Take the following task for example,

```text
**TODO pay the telephone fee
DEADLINE: <2018-03-04 Sun 09:17 .+1m>
```

If you finish this task on 2018-03-01, Org will shift the task like:

```text
**TODO pay the telephone fee
DEADLINE: <2018-04-01 Sun 09:17 .+1m>
```


## <span class="section-num">4</span> repeated period {#repeated-period}



Sometimes, you know how long the repeated task will last. Take the
noon nap for example, usually I will set up a alarm to wake me up half
an hour later. So, I can set the task with repeated period instead of
repeated timestamp.

So the noon nap event will be like:

```text
**TODO take a noon nap
SCHEDULE:<2018-03-04 Sun 12:30-13:30 ++1d>
```

This will schedule a noon nap every day from 12:30 to 13:00.
