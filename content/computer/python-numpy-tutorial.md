+++
title = "Python numpy tutorial"
author = ["Eason Zhang"]
summary = "As a replacement of Matlab (I miss Matlab for its clean and concise grammar), numpy is the core library for scientific computing in Python. It provides a high-performance multidimensional array object, and tools for working with these arrays."
date = 2018-06-03T17:35:00+08:00
lastmod = 2018-06-03T17:36:00+08:00
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

- <span class="section-num">1</span> [Python](#python)
    - <span class="section-num">1.1</span> [Basic data types](#basic-data-types)
        - <span class="section-num">1.1.1</span> [numbers](#numbers)
        - <span class="section-num">1.1.2</span> [Booleans](#booleans)
        - <span class="section-num">1.1.3</span> [Strings](#strings)
    - <span class="section-num">1.2</span> [Containers](#containers)
        - <span class="section-num">1.2.1</span> [lists](#lists)
        - <span class="section-num">1.2.2</span> [Dictionaries](#dictionaries)
        - <span class="section-num">1.2.3</span> [Sets](#sets)
        - <span class="section-num">1.2.4</span> [Tuples](#tuples)
    - <span class="section-num">1.3</span> [Functions](#functions)
- <span class="section-num">2</span> [Numpy](#numpy)
    - <span class="section-num">2.1</span> [Arrays](#arrays)
    - <span class="section-num">2.2</span> [Array indexing](#array-indexing)
        - <span class="section-num">2.2.1</span> [slicing indexing](#slicing-indexing)
        - <span class="section-num">2.2.2</span> [integer array indexing](#integer-array-indexing)
        - <span class="section-num">2.2.3</span> [boolean array indexing](#boolean-array-indexing)
    - <span class="section-num">2.3</span> [Datatypes](#datatypes)
    - <span class="section-num">2.4</span> [Array math](#array-math)
    - <span class="section-num">2.5</span> [Broadcasting](#broadcasting)
- <span class="section-num">3</span> [summary](#summary)

</div>
<!--endtoc-->


## <span class="section-num">1</span> Python {#python}



As a high-level dynamically typed multiparadigm programming language, python
is attracts more and more attensions. Because of its strict indentation
requirement, python code has some beauty in it.

Using Emacs and IPython, I finished the [tutorial](http://cs231n.github.io/python-numpy-tutorial/) written by [Justin Johnson](https://cs.stanford.edu/people/jcjohns/) .
The following sections share the same architecture as in the tutorial.
However, for the sake of learning, I input all the code and add my
understanding. Because I learn Matlab beforehand, some differencec between
Matlab and Python are mentioned. During the learning, I use python 3.6
instead of python 3.5 in the tutorial.


### <span class="section-num">1.1</span> Basic data types {#basic-data-types}



Like most languages, Python has a number of basic types including integers,
floats, booleans, and strings.


#### <span class="section-num">1.1.1</span> numbers {#numbers}



Numbers include integer and float types and work as in other language.

```python
x = 3
print(type(x)) # Prints "<class 'int'>"
print(x)       # Prints "3"
print(x+1)     # Addition; prints "4"
print(x-1)     # Subtraction; print "2"
print(x*2)     # Multiplication; prints "6"
print(x**2)    # Exponentiation; print "9"
x += 1
print(x)       # Print "4"
x *= 2
print(x)       # Print "8"
y = 2.5
print(type(y)) # Print "<class 'float'>"
print(y, y+1, y*2, y**2) # Prints "2.5 3.5 5.0 6.25"
```

Python has `+=`  , `*=` , `-=` , `/=`  operators. However `a++` and `a--`
are not supported in Python.


#### <span class="section-num">1.1.2</span> Booleans {#booleans}



Different from Matlab, Python use `and` , `or` to implement Booleans
logic. In Matlab, which was implemented using `&&` and `||` .

```python
t = True
f = False
print(type(t)) # Prints "<class 'bool'>"
print(t and f) # logical AND; prints "False"
print(t or f)  # logical or; prints "True"
print(not t)   # logical NOT; print "False"
print(t != f)  # logical XOR; prints "True"
```

In matlab "not equal" was symbolized by `~=` instead of `!=` .


#### <span class="section-num">1.1.3</span> Strings {#strings}



I think Python support more on strings.

```python
hello = 'hello' # String lterals can use single quotes
world = "world" # double quotes; has the same effects as single ones
print(hello)    # Prints hello
print(len(hello)) #String length; prints "5"
hw = hello + ' ' + world # String concatenation
print(hw) # prints "hello world"
hw12 = '%s %s %d' % (hello,world,12)
print(hw12) # Prints "hello world 12"
```

In Python3.6, there is a handy sting called f-string. The last two lines
code above can be written as:

```python
print(f'{hello} {world} 12')
```

Quite a lot of methods are provided for strings:

```python
s = "hello"
print(s.capitalize())   # Capitalize a string; prints "Hello"
print(s.upper()) # Print "HELLO"
print(s.rjust(7)) # right-justify a string, padding with spaces;
print(s.center(7)) # center a string, padding with space;
print(s.replace('l','(ell)')) # replace all instances of one substring
#with another
```

More methods can be found [in the document](https://docs.python.org/3.5/library/stdtypes.html#string-methods).


### <span class="section-num">1.2</span> Containers {#containers}



There are four built-in container types: lists, dictionaries, sets and
tuples.


#### <span class="section-num">1.2.1</span> lists {#lists}



A list is the Python equivalent of an array, but is resizeable and can
contain element of different types.

```python
xs = [3,1,2] # Create a list
print(xs,xs[2]) # prints "[3,1,2] 2"
print(xs[-1]) # print the last element; print "2"
xs[2] = 'foo' # different  types
print(xs) # print "[3,1,'foo']"
xs.append('bar')
print(xs) # print "[3,1,'foo','bar']"
x = xs.pop()
print(x,xs) # prints "bar [3,1,'foo']"
```

As usual, you can find all the gory details about lists [in the document](https://docs.python.org/3.5/tutorial/datastructures.html#more-on-lists).

If you are impatient to access list elements one at a time, slicing is an
excellent choice to access more than one elements in a list.

```python
nums = list(range(5)) # range is a built-in function that create a list of integers
print(nums) # print "[0,1,2,3,4]"
print(nums[2:4]) # get a slice from index 2 to 4 (exclusive);print "[2,3]"
print(nums[2:]) # prints "[2,3,]"
print(nums[:2]) # get a slice from the start to index 2(exclusive). prints "[0,1]"
print(nums[:]) # the whole list
print(nums[:-1]) # slice indices can be negative; prints "[0,1,2,3]"
nums[2:4] = [8,9]
print(nums) # Prints "[0,1,8,9,4]"
```

You can also loop over the elements of a list like this:

```python
animals = ['cat', 'dog','monkey']
for animal in animals:
    print(animal)
```

If you want access to the index of each element within the body of a loop,
use the built-in `enumerate` function

```python
animals = ['cat','dog','monkey']
for idx,animal in enumerate(animals):
    print('#%d: %s' % (idx + 1,animal))
```

Next, I want to show a point which does not exists in Matlab: list
comprehensions. Consider the following code:

```python
nums = [0,1,2,3,4]
squares = []
for x in nums:
    squares.append(x ** 2)
print(squares)
```

Using the list comprehensions, we implement the above with extremely short
code.

```python
nums = [0,1,2,3,4]
squares = [x ** 2 for x in nums]
print(squares)
```

You do not have to define `square` before you use it. list comprehensions
can also contain conditions:

```python
nums = [0,1,2,3,4]
even_squares = [x ** 2 for x in nums if x % 2 == 0]
print(even_squares)
```


#### <span class="section-num">1.2.2</span> Dictionaries {#dictionaries}



The values in a dictionary are pairs of `(key,value)` . You can access the
value through the key just like what you do when you look up a dictionary.

Dictionary type use `{}` as the limiters.

```python
d = {'cat':'cute','dot':'furry'} # Create a new dictionary with some data
print(d['cat']) # Get an entry from a dictionary using the key 'cat'
print('cat' in d) # Prints "True"; check if a dictionary has a given entry
d['fish'] = 'wet' # set a new entry in a dictionary
print(d['fish'])  # print "wet"
print(d.get('monkey','N/A')) # get an element with a default; print "N/A"
print(d.get('fish','N/A')) # Print "wet"
del d['fish'] # remove an element from a dictionary
print(d.get('fish','N/A')) # Print "N/A"
```

More methods for dictionary can be found [in the document.](https://docs.python.org/3.5/library/stdtypes.html#dict)

Like in list, you can also loop in a dictionary. The different is that in
a dictionary, you loop using the keys.

```python
d = {'person':2, 'cat':4,'spider':8}
for animal in d:
    legs = d[animal]
    print(f'a {animal} has  {legs} legs')
```

The output will be:

```text
a person has  2 legs
a cat has  4 legs
a spider has  8 legs
```

Also, there is dictionary comprehensions, which are similar to list
comprehensions, but allow you to easily construct dictionaries.

```python
nums = [0,1,2,3,4]
even_num_to_square = {x: x**2 for x in nums if x % 2 == 0}
print(even_num_to_square)
```

Notice that you can even print a dictionary directly using the `print`
function.


#### <span class="section-num">1.2.3</span> Sets {#sets}



A set is a collection of distinct elements. Notice the world **distinct**. A
set has the same meaning what a mathematician mean. In particular, in a
set there are not two identical elements. Set use `{}` as the limiter the
same as dictionary.

```python
animals = {'cat','dog'}
print('cat' in animals) # True
print('fish' in animals) # False
animals.add('fish') # add 'fish' in the set
print('fish' in animals) # True
print(len(animals)) # 3
animals.add('cat') # add 'cat' second time, nothing happen
print(len(animals)) # 3
animals.remove('cat') # remove 'cat' from the set
print(len(animals)) # 2
```

You can find more about set [in the document](http://cs231n.github.io/python-numpy-tutorial/#python-sets).

You can also iterate over a set. Since sets are unordered, you cannot make
assumptions about the order in which you visit the elements of the set.

```python
animals = {'cat','dog','fish'}
for idx,animal in enumerate(animals):
    print(f'# {idx} : {animal}')
```

And the output will be:

```text
# 0 : fish
# 1 : cat
# 2 : dog
```

Like lists and dictionarier, sets can be constructed by set
comprehensions.

```python
from math import sqrt
nums = {int(sqrt(x)) for x in range(20)}
print(nums)
```

The output will be:

```text
{0,1,2,3,4}
```


#### <span class="section-num">1.2.4</span> Tuples {#tuples}



Tuple is the fourth container in Python. A tuple is an immutable ordered
list of values. A tuple is in many ways similiar to a list. One of the
most important differences is that tuples can be used as keys in
dictionaries and as elements of sets, while lists cannot. Let's take a
look at a trivial example.

A tuple is enclosed in parentheses. It is not possible to assign to the
individual items of a tuple. However, it is possible to create tuples
which contain mutable objects, such as lists.

```python
d = {(x,x+1):x for x in range(10)} # create a dictionary
t = (5,6) # create a tuple
print(type(t)) # <class 'tuple'>
print(d[t]) # 5
print(d[(1,2)]) # 1
```

You can find more about tuples [in the document.](https://docs.python.org/3.5/tutorial/datastructures.html#tuples-and-sequences)


### <span class="section-num">1.3</span> Functions {#functions}



Python function are defined using the `def` keyword. For example:

```python
def fib(n):
    """Print a fibonacci series up to n"""
    a,b = 0,1
    while a < n:
        print(a,end = ' ')
        a,b = b,a+b
    print()
```

The keyword `def` introducs a function definition which must be followed
by the function name and the parenthesized list of formal parameters. The
statements that form the body of the function start at the next line, and
must be indented.

Sometimes, we want to define functions that have default arguments, like
this:

```python
def hello(name, loud=False):
    if loud:
        print(f'HELLO, {name.upper()}')
    else:
        print(f'Hello, {name}')
```

Notice that `loud` will be `False` by default. If you call the function
`hello` with asignning any value to `loud`, it will be `False`.  Of
course, you can call `hello` using `hello('Bob',True)` . You can also call
`hello` using `hello('Bob',loud=True)` .

You can find more about define a function [in the document.](https://docs.python.org/3.5/tutorial/controlflow.html#defining-functions)


## <span class="section-num">2</span> Numpy {#numpy}



As the core library of scientific computing in Python, Numpy make Python a
replacement of Matlab even when there are quite a lot of differences
between Numpy and Matlab. Because of open course, Numpy gets quite a lots
of features to support scientific computation.


### <span class="section-num">2.1</span> Arrays {#arrays}



A numpy array is a grid of values. All the values share the same type. A
numpy array can be indexed by a tuple of nonnegative integers. The number of
dimensions is the rank of the array. The shape of an array is a tuple of
integers giving the size of the array along each dimension.

We can create a numpy arrays from nested Python lists, and access elements
using square brackets.

```python
import numpy as np
a = np.array([1,2,3])
print(type(a))
print(a.shape)
print(a[0],a[1],a[2])
a[0] = 5
print(a)

b = np.array([[1,2,3],[4,5,6]])
print(b.shape)
print(b[0,0],b[0,1],b[1,0])
print(b.ndim)
```

As in Matlab, numpy also provides many functions to create special arrays:

```python
import numpy as np

a = np.zeros((4,4))
print(a)

b = np.ones((2,2))
print(b)

c = np.full((2,2),9)
print(c)

d = np.eye(2)
print(d)

e = np.random.random((2,2))
print(e)
```

Another two useful methods are `arange` and `linspace`

```python
import numpy as np

a = np.arange(10) #exclude 10
print(a)

b = np.linspace(1,4,6) #include 4
print(b)
```

More methods can be found [in the document](https://docs.scipy.org/doc/numpy/user/basics.creation.html#arrays-creation).


### <span class="section-num">2.2</span> Array indexing {#array-indexing}



You can access the element of an array one by one or more than one at a
time. I like slicing very much. Because it is an effective way to access
more than one elements at a time.


#### <span class="section-num">2.2.1</span> slicing indexing {#slicing-indexing}



```python
import numpy as np

a = np.array([[1,2,3,4],
              [5,6,7,8],
              [9,10,11,12]])
b = a[:2,1:3]
print(b)
c = a[::2,0::2]
print(c)

```

The output will be:

```text
[[2 3]
 [6 7]]
[[ 1  3]
 [ 9 11]]
```

Notice that:

1.  In python, index starts from zero instead of one. (In Matlab, index
    starts from one)
2.  the slicing has the form `start:stop:step` , which mean start from the
    `start` and stop at `stop` (exclusive) with step as `step`

In Python, negative integer can also be used as index which provides
flexibility for accessing the elements in an array.

One important thing about slicing is that the origin one and the sliced
result are closely related. please take a look at [this post](https://www.zcl.space/computer/copy-and-deep-copy-in-python/).

Let's follow the above example.

```python
b[0,0] = 99
print(b)
print(a)
```

And the output will be:

```text
[[99  3]
 [ 6  7]]

[[ 1 99  3  4]
 [ 5  6  7  8]
 [ 9 10 11 12]]
```

Notice that the `99` appears at `b[0,0]` and `a[0,1]` . I did not set
`a[0,1]` explicitly, but it was changed.

When you index the numply arrays using slicing, the resulting array view
will always be a subarray of the original way. If you change the subarray,
the origin array will be changed too. This is pretty weird for engineer
coming from Matlab.


#### <span class="section-num">2.2.2</span> integer array indexing {#integer-array-indexing}



Another way of indexing array is integer array indexing. For example:

```python
import numpy as np
a = np.array([[1,2],
              [3,4],
              [5,6]])

print(a[[0,1,2],[0,1,0]])
```

Notice that integer array indexing does not have the effect of "view". You
can change the new array resulting from integer array indexing without
worry about changing the origin array.

Another advantage of integer array indexing is that you can modify certain
positions of an array at a time. For example:

```python
import numpy as np

a = np.array([[1,2,3],
              [4,5,6],
              [7,8,9],
              [10,11,12]])

print(a)

#Create an array of indices
b = np.array([0,2,0,1])
# Select one element from each row of the array
# using the indices in b

print(a[np.arange(4),b])

a[np.arange(4),b] += 10

print(a)
```

Notice that only some positions of the array `a` are added 10. The
positions are represented by `np.arange(4),b` . I think this is of high
efficiency.


#### <span class="section-num">2.2.3</span> boolean array indexing {#boolean-array-indexing}



Boolean array indexing is another method of indexing an array. In matlab,
there is boolean array indexing too. According to my experience, boolean
array indexing is used to pick up certain elements of an array satisfying
cerntain conditions.

```python
import numpy as np
a = np.array([[1,2],
              [3,4],
              [5,6]])
# bool_idx are positions where
# the elements are greater than 2
bool_idx = (a > 2)

print(bool_idx)

print(a[bool_idx])
print(a[a>2])
```

The shape of `bool_idx` is the same as `a` . The value of `bool_idx` is
`True` where `a>2` satisfies. The last line tells us that we can finish
the finding of positions and picking up the elements in one concise
statement.

You can find more on indexing [in the document.](https://docs.scipy.org/doc/numpy/reference/arrays.indexing.html)


### <span class="section-num">2.3</span> Datatypes {#datatypes}



Every numpy array is a grid of elements of the same type. Numpy provides a
large set of numeric datatypes that you can use to construct arrays. Numpy
tries to guess a datatype when you create an array, but functions that
construct arrays usually also include an optional argument to explicitly
specify the datatype. For example:

```python
import numpy as np
x = np.array([1,2])
print(x.dtype)

x = np.array([1.0,2.0])
print(x.dtype)

x = np.array([1,2],dtype=np.int64)
print(x.dtype)

x = np.random.random((1,2))
print(x.dtype)

x = np.array([1+5j,2 + 4j])
print(x.dtype)
```

The output is :

```text
int64
float64
int64
float64
complex128
```

Notice that for a complex number, numpy use the `complex128` to
indicate the datetype.


### <span class="section-num">2.4</span> Array math {#array-math}



It is always more efficient to do algebra in vector mode so that the
computation is expected to be finished in a parallel way. Because
everything in python is object, the operators can be overloaded.

```python
import numpy as np

x = np.array([[1,2],[3,4]],dtype=np.float64)
y = np.array([[5,6],[7,8]],dtype=np.float64)


print(x+y)
print(np.add(x,y))
```

One point that needs our attention is the matrix multiplication. There are
two types of multiplication between matrices: one is elementwise
multiplication and the other one is matrix multiplication. In Matlab, we
use `*` to implement the matrix multiplication and `.*` to implement the
elementwise multiplication. In Python, things are different. `*` is use to
implement elementwise multiplication and `dot` is used to compute matrix
multiplication.

```python
import numpy as np

x = np.array([[1,2],[3,4]])
y = np.array([[5,6],[7,8]])

v = np.array([9,10])
w = np.array([11,12])

# all the following 4 statements produce 219
print(v.dot(w))
print(w.dot(v))
print(np.dot(v,w))
print(np.dot(w,v))

# matrix multiplication

print(x.dot(y))
print(np.dot(x,y))

# AB != BA
print(y.dot(x))
print(np.dot(y,x))
```

Like in Matlab, we can sum up the matrix along one axis.

```python
import numpy as np

x = np.array([ [1,2],[3,4] ])

# sum all the elements of x
print(np.sum(x))

# sum along the column
print(np.sum(x,axis=0))
# sum along the row
print(np.sum(x,axis=1))
```

Changing the shape of an array is also one frequent operation. The most
used operation is transposing a matrix.

```python
import numpy as np

x = np.array([[1,2],[3,4]])

print(x)
print(x.T)
```

If you want to reshape an array, `shape` is used.

```python
import numpy as np

a = np.arange(12)
print(a)

b = a.reshape((3,4))
print(b)
```

The output will be:

```text
[ 0  1  2  3  4  5  6  7  8  9 10 11]

[[ 0  1  2  3]
[ 4  5  6  7]
[ 8  9 10 11]]
```

Notice that `np.arange(n)` will exclude the `n`. and from shape `(12,)` to
shape `(3,4)`, Python write the `(3,4)` row first. However, in Matlab, it
is column first.


### <span class="section-num">2.5</span> Broadcasting {#broadcasting}



In Matlab, if you want to add two  matrices, they must have the same
dimension, or an error will be throwed out.  However, in Python there is a
mechanism called "Broadcasting" which allow you to work with arrays with
different shapes.

Suppose we want to add a constant vector to each row of a matrix. We would
like this:

```python
import numpy as np

x = np.array([[1,2,3],
              [4,5,6],
              [7,8,9],
              [10,11,12]])

v = np.array([1,0,1])

#create an empty matrix with the same shape as x
y = np.empty_like(x)

for i in range(4):
    y[i,:] = x[i,:] + v

print(y)
```

The above code implement what we want. However, from the eye of Python, it
is not concise. You have to iterate over `x` . Python allows you broadcast
the `v` to each row of `x`

```python
import numpy as np

x = np.array([[1,2,3],
              [4,5,6],
              [7,8,9],
              [10,11,12]])
v = np.array([1,0,1])
y = x + v
print(y)
```

It is so easy. It works even `x` has shape `(4,3)` and `v` has shape `(3,)`
due to broadcasting.

Broadcasting two arrays together follows thses rules:

1.  if the arrays do not have the same shape, prepend the shape of the lower
    array with 1s until both shapes have the same length.
2.  The two arrays are said to be compatible in a dimension if they have the
    same size in the dimension, of if one of the arrays has size 1 in that
    dimension.
3.  The arrays can be broadcast together if they are compatible in all
    dimensions.
4.  After broadcasting, each array behaves as if it had shape equal to the
    elementwise maximum of shapes of the two input arrays.
5.  In any dimension where one array had size 1 and the other array had size
    greater than 1, the first array behaves as if it were copied along that
    dimension.

Please check [this document](http://scipy.github.io/old-wiki/pages/EricsBroadcastingDoc) and [this document](https://docs.scipy.org/doc/numpy/user/basics.broadcasting.html) for more explainations.
Functions that support broadcasting is called the universal function. You
can find all the available universal function in [this document](https://docs.scipy.org/doc/numpy/reference/ufuncs.html#available-ufuncs).


## <span class="section-num">3</span> summary {#summary}



This post summrize some important aspects of Numpy. However, it is far to
be like the [numpy refernence](https://docs.scipy.org/doc/numpy/reference/arrays.indexing.html). You should check the numpy reference
frequently when you are not sure what you are using.
