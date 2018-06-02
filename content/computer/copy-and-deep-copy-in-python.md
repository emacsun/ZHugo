+++
title = "copy and deep copy in python"
author = ["Eason Zhang"]
summary = "the frustraing \"copy\" in python. Every newbie of python from other language maybe frustrated by \"copy\" in python. In python, variable behaves like pointer. If you want to have \"copy\" like what other languages (say, C and java), you have to do extra work to make it."
date = 2018-06-01T21:16:00+08:00
lastmod = 2018-06-02T08:34:00+08:00
tags = ["computer", "python"]
draft = false
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

## Table of Contents

- <span class="section-num">1</span> [No Copy at All](#no-copy-at-all)
- <span class="section-num">2</span> [view or Shallow Copy](#view-or-shallow-copy)
- <span class="section-num">3</span> [Deep Copy](#deep-copy)
- <span class="section-num">4</span> [only happened in array](#only-happened-in-array)

</div>
<!--endtoc-->

In the [tutorial of Numpy](https://docs.scipy.org/doc/numpy/user/quickstart.html), there a section called _Copies and Views_, as a newbie
of Python, I was shocked. In particular, some priori information of Matlab
aggravate the feeling even more. Let's take a look at what happened in Python
when I want to copy the value of one variable to another one.


## <span class="section-num">1</span> No Copy at All {#no-copy-at-all}

Naturally, when I execute `b=a` in any language. `b` is expected to have the
value of `a` , and if `a` and `b` are both array of `int` , then after `b=a` ,
I execute `b[1]=b[1]+1` will make `b[1]` greater than `a[1]` by `1`. However,
this is not the case in Python.

For example:

```text
import numpy as np
a = np.arange(12)
b = a
```

The statement of `b is a` will return `True` which means that `b` and `a` are
two names for the same array object. `b` and `a` behave like the pointer in C.
if you execute `b[1] = 555` ,then `a[1]` will be `555` too.

Also, if you use the `id()` function, `id(a)` and `id(b)` will return the same
value. The `id()` function return the unique identifier of an object. If two
objects have the same identifier, the two objects are actually one object.


## <span class="section-num">2</span> view or Shallow Copy {#view-or-shallow-copy}



`view` is a good word for what shallow copy mean. For a large value, if you
want to change part of it, you view the part you want to change.

For example,

```text
import numpy as np
a = np.random.random((3,5))
```

If you just want to change the second and the third column of `a`, you view the
part you want change by slicing it:

```text
p = a[:,1:3]
p[:] = 10
```

Then the second and third column will be all `10` . `view` behaves like the
microscope. Only the part of viewed will be shared by the two objects.


## <span class="section-num">3</span> Deep Copy {#deep-copy}



What? deep copy? Yes, it's deep copy that implement the real copy as we
expect.

```text
b = a.copy()
```

Then `b` is a complete copy of `a`. `b` and `a` will not share the same
object id. This is what the copy we want.

For example, if you have:

```text
import numpy as np
a = np.arange(4)
b = a.copy()
b[0] = 4
```

you will have `b` equals `[4,1,2,3]` and `a` equals `[0,1,2,3]` . Now `b`
and `a`


## <span class="section-num">4</span> only happened in array {#only-happened-in-array}

Fortunately, the three version copy just happened on array type. when `b`
and `a` are just integers or float numbers, `=`  will implement the real
copy.

For example, when you have:

```text
a = 2
b = a
b += 2
```

then you get `b=4` and `a=2`
