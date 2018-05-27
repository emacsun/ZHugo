+++
title = "learn python the hard way"
author = ["Eason Zhang"]
summary = "notes of /learn python3 the hard way/"
date = 2018-05-27T20:43:00+08:00
lastmod = 2018-05-27T20:49:00+08:00
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

- <span class="section-num">1</span> [a small surprise in ex4.py](#a-small-surprise-in-ex4-dot-py)
- <span class="section-num">2</span> [imcompatiblility  between python 3.5 and 3.6](#imcompatiblility-between-python-3-dot-5-and-3-dot-6)
- <span class="section-num">3</span> [default end is enter](#default-end-is-enter)
- <span class="section-num">4</span> [the multiline string](#the-multiline-string)
- <span class="section-num">5</span> [help in Ipython](#help-in-ipython)
- <span class="section-num">6</span> [call a script with more inputs](#call-a-script-with-more-inputs)
- <span class="section-num">7</span> [open a file](#open-a-file)
- <span class="section-num">8</span> [call function recursively](#call-function-recursively)
- <span class="section-num">9</span> [the input of a function](#the-input-of-a-function)
- <span class="section-num">10</span> [variable in the for loop](#variable-in-the-for-loop)
- <span class="section-num">11</span> [the `range` function](#the-range-function)
- <span class="section-num">12</span> [variable in the for loop and range](#variable-in-the-for-loop-and-range)
- <span class="section-num">13</span> [a project skeleton](#a-project-skeleton)

</div>
<!--endtoc-->

For a long time, I have been planning to learn Python. However, because I never
use Python in my work, the plan was delayed again and again. Today, it is
raining cats and dogs outside. Why not do something I have planned long time ago
in this perfect mode? So I picked up the book _Learning Python the Hard Way_ by
Zed Shaw. During the learning, I use Emacs as my Editor, running the programming
on my old Thinkpad with Ubuntu 16.04 and Python3.5. I am going to learn Python
in the hard way. However, I believe it will be the clever and efficient way.


## <span class="section-num">1</span> a small surprise in ex4.py {#a-small-surprise-in-ex4-dot-py}

Everything goes fine until I am doing exercise 4. The python code is:

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

```text
There are 100 cars available.
There are only 30 drivers avaiable.
There will be 70 empty cars today.
We can transport 120 people today.
We have 90 to carpool today.
We need to put ablout 3.0 in each car
```

and the result is shown belowing the code.

Notice that in the source, the first line concerning print is:

```python
print("There are",cars,"cars available.")
```

instead of

```python
print("There are ",cars," cars available.")
```

Notice the difference? the whitespace. In Python, the whitespace is inserted
around the results automatically which is kind of a surprise for a programmer
familiar with `C/C++` .


## <span class="section-num">2</span> imcompatiblility  between python 3.5 and 3.6 {#imcompatiblility-between-python-3-dot-5-and-3-dot-6}



I have python3.5 installed on my Ubuntu 16.04 hoping it will help me go through
the book _Learning Python the Hard Way_ . However, when it comes to ex5.py, the
dream is waken up.

{{< highlight python "linenos=table, linenostart=1" >}}
my_name = 'Zed A. Shaw'
my_age = 35
my_height = 74
my_weight = 180
my_eyes = 'Blue'
my_teeth = 'White'
my_hair = 'Brown'

print(f"Let's talk about {my_name}.")
print(f"He's {my_height} inches tall.")
print(f"He's {my_weight} pounds heavy.")
print("Actually that's not too heavy.")
print(f"He's got {my_eyes} eyes and {my_hair} hair.")
print(f"His teeth are usually {my_teeth} depending on the coffee.")

# this line is tricky, try to get it exact right
total = my_age + my_height + my_weight
print(f"If I add {my_age}, {my_height}, and {my_weight} I get {total}.")
{{< /highlight >}}

When I execute `python3.5 ex5.py` in terminal. SyntaxError is triggered and it
says:

```text
  File "ex5.py", line 9
    print(f"Let's talk about {my_name}.")
                                       ^
SyntaxError: invalid syntax
```

After carefully comparison with the code in the book, I found no mistakes. So
maybe it is the interpreter that raise the error. So python 3.6 is installed.

```shell
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt-get update
sudo apt-get install python3.6
```

Then I execute `python3.6 ex5.py`, hooray, it works with output:

```text
Let's talk about Zed A. Shaw.
He's 74 inches tall.
He's 180 pounds heavy.
Actually that's not too heavy.
He's got Blue eyes and Brown hair.
His teeth are usually White depending on the coffee.
If I add 35, 74, and 180 I get 289.
```

After this, I began to worry python for its incompatibility even after python3.
Even this little `print` function shows difference, what about other features?


## <span class="section-num">3</span> default end is enter {#default-end-is-enter}



In ex7.py

```python
print("Mary had a little lamb.")
print("Its fleece was white as {}.".format('snow'))
print("And everywhere that Mary went.")
print("."*10)

end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"
# watch end = '' at the end. try removing it to see what happens
print(end1 + end2 + end3 + end4 + end5 + end6 , end=' ')
print(end7 + end8 + end9 + end10 + end11 + end12)
```

The output is:

```text
Mary had a little lamb.
Its fleece was white as snow.
And everywhere that Mary went.
..........
Cheese Burger
```

Notice the line:

```python
print(end1 + end2 + end3 + end4 + end5 + end6 , end=' ')
```

This line change the default `end` as whitespace. By default, the `end` will be
`enter`


## <span class="section-num">4</span> the multiline string {#the-multiline-string}



There are two ways to generate multiline string. first is using the escape
sequence; second is to use three double-quotes pair. Today, I found that three
single-quotes pair is also ok. see the example below.

```python
fat_cat ='''
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
'''

thin_mouse ='''
I'll do another list:
\t* mouse food
\t* Rice
\t* Catnip\n\t* Grass
'''
print(fat_cat)
print(thin_mouse)
```

also don't foget that the string can be format by prefix a `f` to be a f-string.


## <span class="section-num">5</span> help in Ipython {#help-in-ipython}



I like Ipython because of its REPL style. To get help of a function just follow
the function with a ? or ??, then hit the return.

For example, I want to read the help for the builtin function `input`

```text
In [1]: input?
Type:        builtin_function_or_method
String form: <built-in function input>
Namespace:   Python builtin
Definition:  input(prompt)
Docstring:
Read a string from standard input.  The trailing newline is stripped.

The prompt string, if given, is printed to standard output without a
trailing newline before reading input.

If the user hits EOF (*nix: Ctrl-D, Windows: Ctrl-Z+Return), raise EOFError.
On *nix systems, readline is used if available.
```

Maybe, ? and ?? will be the most frequenct symbol I use during using python.


## <span class="section-num">6</span> call a script with more inputs {#call-a-script-with-more-inputs}



You can call a script with more inputs using the `argv` module

```python
from sys import argv
# read the WYSS section for how to run this
script, first, second ,third = argv

print("The script is called:",script)
print("Your first variable is:",first)
print("Your second variable is:",second)
print("Your third variable is:",third)
```

when save the above code as ex13.py, then call it from the shell:

```text
python3.6 ex13.py 1st 2nd 3rd
```

Then the `argv` will contains the `ex13.py` `1st` `2nd` `3rd` . The first line
of the code:

```python
script, first, second, third = argv
```

unpack the `argv` . Then, `script ='ex13.py'`  `first = '1st'`  `second = '2nd'`
and so on.

Another way allowing the user to input is using the function `input` .


## <span class="section-num">7</span> open a file {#open-a-file}



```python
txt = open(filename)
```

The `txt` is not the contents of the file. It is a file object. By this object,
you can move around and read the file. Actually, we can open the file twice and
use two different file objects pointing to the same file.

A file opject also has the following function:

<a id="orgd804b12"></a>

<div class="table-caption">
  <span class="table-number">Table 1:</span>
  functions that a file object can call
</div>

| name           | description                                               |
|----------------|-----------------------------------------------------------|
| close          | close the file                                            |
| read           | read the contents of the file                             |
| readline       | reads just one line of a text file                        |
| truncate       | empties the file                                          |
| write('stuff') | writes "stuff" into the file                              |
| seek(0)        | move the read/write location to the beginning of the file |

By default, the file is opened for reading. If you want to open a file and
writing something into it, use:

```python
txt = open(filename,'w')
```

If you want to open a file, read the contents, then write something into it.

```python
txt = open(filename,'r+')
```

Actually, there is another option for reading and writing `w+`, and the
difference is :

1.  `r+` Open for reading and writing.  The stream is positioned at the beginning
    of the file.
2.  `w+` Open for reading and writing.  The file is created if it does not exist,
    otherwise it is truncated.  The stream is positioned at the beginning of the
    file.

Notice that the `w+` option will truncate the file if it exists. Also, the `w`
option will truncate the file if exists. So the `target.truncate()` is not
necessary if you open a file with `w` or `w+` .

On `close` your file, you will find that most of the time it is ok not close it
because Cpython will do it for you. However, when you forget to close the file,
the contents aimed to be written into the file is actually stored in a buffer.
until you close the file, the contents will not be saved to the file.


## <span class="section-num">8</span> call function recursively {#call-function-recursively}



Look at the code below:

```python
# this one is like your scripts with argv
def print_two(*args):
    arg1,arg2,arg3 = args
    print(f"arg1: {arg1},arg2: {arg2}, arg3: {arg3}")
    print_none()
# ok, that *args is actually pointless, we can just do this
def print_two_again(arg1,arg2):
    print(f"arg1: {arg1},arg2: {arg2}")

# this just takes one argument
def print_one(arg1):
    print(f"arg1: {arg1}")

# this one takes no arguments
def print_none():
    print("I got nothin'.")
    print_two("Zhang","Chao","long")

print_two_again("Zed","Shaw")
print_one("First!")
print_none()
```

Notice that `print_two` calls `print_none` and vice versa. This will raise the
RecursionError :

```text
RecursionError: maximum recursion depth exceeded while calling a Python object
```

I am just curious what will happen if I let two functions call each other
recursively. :)


## <span class="section-num">9</span> the input of a function {#the-input-of-a-function}



Input to a function is just like `argv` to a script. I found that duirng the
input of a function can also be a function:

```python
print("input the argument:")
cheese_and_crackers(input("arg1:"),input("arg2:"))
```

Drill more on the `input("arg1:")` , I found that the return of `input("arg1:")`
is a str, so there must be an automatic convert from str to int for the
`cheese_and_crackers` .

```python
cheese_and_crackers(input("arg1:")+10,input("arg2:"))
```

will raise a TypeError. So:

```python
cheese_and_crackers(int(input("arg1:"))+10,input("arg2:"))
```

will work as I wish. Furthermore, maybe the `int` should be `float` to accept
float number.


## <span class="section-num">10</span> variable in the for loop {#variable-in-the-for-loop}



In a `for` loop, python can use a variable that isn't defined yet. This is because
that the `for` loop defines the variable and initialize it to the current
element of the loop iteration each time through.

Now, we give an example:

{{< highlight python "linenos=table, linenostart=1" >}}
# we can also build lists, first start with an empty one
# you have to define this variable before you use it.
elements = []

# then use the range function to do 0 to 5 counts
for i in range(4,100,16):
    # you don't have to define i before you use it.
    print(f"Adding {i} to the list.")
    # append is a function that lists understand
    elements.append(i)


i = 20
print(f"i is {i}")
# now we can print them out too
for i in elements:
    #even you define i = 6, i will be overwritten in the for statement
    print(f"Element was: {i}")

print(f"i is {i}")
{{< /highlight >}}

At first, we define an empty list `elements` , then we fill the list with
`range(3,100,16)` . After that we print the elements of the list. Notice that
even we define a variable `i=20` , the statement `for i in elements:` will
define a new variable `i` and overwrite the value of `20` . The value of the new
`i` is the value of the first element of the list. After each loop, the `i`
steps through the list.

The result is:

```text
Adding 4 to the list.
Adding 20 to the list.
Adding 36 to the list.
Adding 52 to the list.
Adding 68 to the list.
Adding 84 to the list.
i is 20
Element was: 4
Element was: 20
Element was: 36
Element was: 52
Element was: 68
Element was: 84
i is 84
```

Notice that before the `for` loop, `i=20` . Once the `for` loop begins, `i`
will be recreated and be asigned value `4` which is the first element of the
list. After the `for` loop, `i=84` .


## <span class="section-num">11</span> the `range` function {#the-range-function}



In ex32, there appears a builtin function `range`. `range` is used to generate a
sequence of integers, and its help doc is:

```text
Type:            type
String form:     <class 'range'>
Namespace:       Python builtin
Init definition: range(self, *args, **kwargs)
Docstring:
range(stop) -> range object
range(start, stop[, step]) -> range object

Return an object that produces a sequence of integers from start (inclusive)
to stop (exclusive) by step.  range(i, j) produces i, i+1, i+2, ..., j-1.
start defaults to 0, and stop is omitted!  range(4) produces 0, 1, 2, 3.
These are exactly the valid indices for a list of 4 elements.
When step is given, it specifies the increment (or decrement).
```

Notice that:

```python
range(start,stop,step)
```

will generate the sequence of integers including the `start` and excluding the
`stop` . This is different from Matlab, in which `start:step:stop` will include
both the `start` and the `stop` .


## <span class="section-num">12</span> variable in the for loop and range {#variable-in-the-for-loop-and-range}



Check the following code:

{{< highlight python "linenos=table, linenostart=1" >}}
def loopnumber(variable,step):
    numbers = []
    i = 2
    for i in range(i,variable,step):
        numbers.append(i)
    return numbers

variable = 9
step     = 2
print("The numbers: ")
for num in loopnumber(variable,step):
    print(num)
{{< /highlight >}}

Notice the `i` in the line 4, the first `i` will be created at the start of the
loop while the second `i` will take the value from line 3. So the contents of
`numbers` will be `[2,4,6,8]`


## <span class="section-num">13</span> a project skeleton {#a-project-skeleton}



Because of the issue of python multi-version, it will be safe to
start your project with `virtualenv` . Using `virtualenv` , your python
environment is safe even if you install multiple python on your computer.
This section will help you create a skeleton directory which you can use to
start a new project up easily. The skeleton directory will have your project
layout, automated tests, modules, and install scripts. When a new project is to
be created, you just copy this directory ,rename it and everything is ready for
you to start coding.

As mentioned before, `virtualenv` will be needed. so install it:

```text
sudo pip3 install virtualenv
```

Sometimes, the pip will crash. If you want to reinstall your pip, goto the
[website](https://pypi.org/project/pip/#files) , download and extract the source, then install it using:

```text
sudo python3 setup.py install
```

During my installation of `virtualenv`, there is an error `Missing dependencies
for SOCKS support` . You need the following commands:

```text
unset all_proxy
unset ALL_PROXY
pip install pysocks
source .bashrc
```

and `pip` works again with socks proxy. want more please check [here](https://stackoverflow.com/questions/40926018/pip-install-doesnt-work-invalidschema-missing-dependencies-for-socks-support/43135798).

If `virtualenv` is ready, then you can create a python installation, which is
handy to manage versions of your package for different projects. The following
commands will create the virtual environment.

{{< highlight shell "linenos=table, linenostart=1" >}}
mkdir ~/.venvs
virtualenv ~/.venvs/lpthw
. ~/.venvs/lpthw/bin/activate
{{< /highlight >}}

then you will find the shell symbol changing from `$` to `(lpthw) $` . After
that you will find there is a `python` under `/lpthw/bin` . The final step is to
install `nose` , which is a testing framework we'll use.

```text
pip install nose
```

Notice that the `nose` will appear at directory `~/.venvs/lpthw/bin` . This let
you install different versions of python packages for different projects without
infecting the main system environment.

Note that when in shell you should have `(lpthw)` at the very beginning of the
line with `$`.

```text
. ~/.venvs/lpthw/bin/activate
```

will tell the shell that the virtual environment use python installed at
`~/.venvs/lpthw/bin/`

This project skeleton is useful when you want to create a module based on
certain vertion of python.
