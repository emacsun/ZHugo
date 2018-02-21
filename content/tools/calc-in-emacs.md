+++
title = "Using Emacs as a calculator through Cals"
author = ["Eason Zhang"]
date = 2018-02-20T17:13:00+08:00
lastmod = 2018-02-21T09:18:00+08:00
tags = ["tools", "calc"]
categories = ["Emacs"]
draft = false
summary = "Summary of my use of Calc as a calculator"
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
- <span class="section-num">2</span> [Main Features](#main-features)
- <span class="section-num">3</span> [switch between the algebraic and RPN mode](#switch-between-the-algebraic-and-rpn-mode)
- <span class="section-num">4</span> [adding two numbers](#adding-two-numbers)
- <span class="section-num">5</span> [reference](#reference)
</div>
<!--endtoc-->




## <span class="section-num">1</span> Introduction {#introduction}



In Emacs, execute `M-x calc` and you are in a `Calc` buffer. At first
time, perhaps you will be confused how begin. Press `?` you will get a
help manual.

Normally, Calc uses the RPN (Reverse Polish Notation) notation, which
is not the natation what I am familiar with. However, It did not take
me much time to get used to it. Generally, the core of an RPN
calculator is the stack. A calculator stack is like a stack of dishes.
New dishes are added at the top of the stack, and numbers are normally
only removed from the top of the stack. Also, in a RPN calculator,
operands are always entered first, the operator second. The calculator
pops the appropriate number of operands from the stack and pushes back
the result.

Take `2+3` for example, first, you enter 2;second , 3; at last, you
enter `+` . Then the 2 and 3 pops from the stack and 5 are pushed on
the top of the stack.


## <span class="section-num">2</span> Main Features {#main-features}



1.  Choice of algebraic or RPN entry of calculations;
2.  Arbitrary precision integers and floating-point numbers.
3.  Arithmetic on rational numbers, complex numbers (rectangular and
    polar), error forms with standard deviations, open and closed
    intervals, vectors and matrices, dates and times, infinities, sets,
    quantities with units, and algebraic formulas.
4.  Mathematical operations such as logarithms and trigonometric
    functions.
5.  Programmer's features (bitwise operations, non-decimal numbers).
6.  Financial functions such as future value and internal rate of
    return.
7.  Number theoretical features such as prime factorization and
    arithmetic modulo m for any m.
8.  Algebraic manipulation features, including symbolic calculus.
9.  Moving data to and from regular editing buffers.
10. Embedded mode for manipulating Calc formulas and data directly
    inside any editing buffer.
11. Graphics using GNUPLOT, a versatile (and free) plotting program.
12. Easy programming using keyboard macros, algebraic formulas,
    algebraic rewrite rules, or extended Emacs Lisp.

From the features listed above, we can see Calc is a versatile
calculator. It is almost impossible for me to touch all the features
during daily use. Calc is large and maybe intimidating to the
first-time user. My knowledge of Calc grows as time goes by. I use
Calc every time when I want to calculate something. Day by day, I
learn more and more about Calc.

This post is the record of my use of Calc.


## <span class="section-num">3</span> switch between the algebraic and RPN mode {#switch-between-the-algebraic-and-rpn-mode}



`calc-algebraic-entry`

This command is used to input an expression in the algebraic mode
temporally. After this the Calc is in RPN mode. When you execute
the `calc-algebraic-entry` the minibuffer will be leading by the
word **Algebraic:** instead of **Calc:**, which is used in the RPN
mode.

After the **Algebraic:** you can enter your algebraic expression.

In the Calc buffer, press `'` also bring you the algebraic mode.
Press `'` two times bring you the last algebraic expression you
entered.

`calc-algebraic-mode`

This command will turn the Calc into algebraic mode. After calling
this command, every time you enter something in the Calc buffer,
the Calc is in the algebraic mode i.e. every time you enter
something , the minibuffer will be leading **Algebraic:** . So any
algebraic expression is accepted. I even try the `2 + log10(100)`
and it returns `4` .


## <span class="section-num">4</span> adding two numbers {#adding-two-numbers}



In the RPN mode, you enter the first operand and the second
operand, at last you enter `+` , then the first operand and the
second operand pops out of the stack and the result is pushed
back.

subtraction, multiplication and divide are in a straightforward
way.


## <span class="section-num">5</span> reference {#reference}



1.  [The Emacs Calculator.](http://nullprogram.com/blog/2009/06/23/)
2.  [The manual: The GNU Emacs Calculator.](https://www.gnu.org/software/emacs/manual/html_node/calc/index.html#Top)
