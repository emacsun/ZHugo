+++
title = "Density Evolution"
date = 2018-02-07T20:02:00+08:00
lastmod = 2018-02-07T22:26:00+08:00
tags = ["telecommunication", "LDPC"]
categories = ["telecommunication"]
draft = false
summary = "Density evolution plays the foundamental role in designing and analyzing LDPC"
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
- <span class="section-num">2</span> [Density evolution on the BEC](#density-evolution-on-the-bec)
    - <span class="section-num">2.1</span> [Regular LDPC codes](#regular-ldpc-codes)
    - <span class="section-num">2.2</span> [Irregular LDPC codes](#irregular-ldpc-codes)
- <span class="section-num">3</span> [threshold and stability of density evolution on BEC](#threshold-and-stability-of-density-evolution-on-bec)
- <span class="section-num">4</span> [Density evolution on general memoryless channels](#density-evolution-on-general-memoryless-channels)
    - <span class="section-num">4.1</span> [get an excellent degree distribution](#get-an-excellent-degree-distribution)
- <span class="section-num">5</span> [Summary](#summary)
</div>
<!--endtoc-->


## <span class="section-num">1</span> Introduction {#introduction}



For a given Tanner graph, it is still an open question to tell for
which channel noise level the message passing algorithm will be able
to reach a reliable transmission. Fortunately, it is possible to tell
how an ensemble of Tanner graphs is likely to behave given that the
channel is memoryless and the Tanner graphs are all cycle free. We
could do this by tracking the evolution of probability density
functions during the message passing procedure. We call this method
**Density Evolution** which is first invented by Richardson and Urbanke
in their papers in 2001.

Now there are some effective ways to decide whether a LDPC ensemble is
good or not, but most of them are based on density evolution. We
define **threshold** as the maximum level of channel noise under which
the MPA(message passing algorithm) can reach a reliable transmission.
By watching the threshold, we can design some excellent LDPC ensemble,
from which a good LDPC matrix can be selected.


## <span class="section-num">2</span> Density evolution on the BEC {#density-evolution-on-the-bec}



On the BEC, an erased bit can be corrected if that bit was the only
bit in the parity check equation. We assume that the MPA is passing
messages down through the layers of a Tanner graph which is a tree.
Under such assumption the bit-to-check message to check node in a
lower level of the graph is determined by the check-to-bit message
from all the incoming edges in the level above.


### <span class="section-num">2.1</span> Regular LDPC codes {#regular-ldpc-codes}



Problem: given an ensemble \\(\mathcal{T}(w\_{c},w\_{r})\\), which sonsists of all
regular LDPC Tanner graphs with bit nodes of degree \\(w\_{c}\\) and check nodes of
degree \\(w\_{r}\\), show the maximum erasure probability at which the MPA can
recover all the erasure bit.

For BEC, the message hold either the current value of the bit ( can be "1" or
"0") or "x" (the bit value is unknown). Define \\(q\_{l}\\) as the probability that
at iteration \\(l\\) a check to bit message is an \\(x\\) and \\(p\_{l}\\) as the
probability that at iteration \\(l\\) a bit to check message is an \\(x\\).

For a regular LDPC ensemble, the C2B (check to bit) message on an edge is \\(x\\)
if one or more of the incoming messages on the other \\(w\_{r} - 1\\) edges into
that check node is an \\(x\\). Suppose that all the incoming messages are
identical and independent of each other, i.e. they have i.i.d. So,

\begin{equation}
\label{eq:2}
q\_{l} = 1 - (1-p\_{l})^{(w\_{r} - 1)}
\end{equation}

At iteration \\(l\\), the B2C message will be \\(x\\) if the origin message from the
channel was an erasure and all the incoming message from check at iteration
\\(l-1\\) are erasures. So,

\begin{equation}
\label{eq3}
p\_{l} = \epsilon(q\_{l-1})^{w\_{c} - 1}
\end{equation}

Here, \\(\epsilon\\) is the probability of \\(x\\) for the origin message from the
channel. We use \\(w\_{c} - 1\\) instead of \\(w\_{c}\\), because we have to remove
the message coming from the check node to which the bit node will send the new
message. We do this to make the messages uncorrelated.

Combining the \\(q\_{l}\\) and \\(p\_{l}\\), we get:

\begin{equation}
\label{eq:6}
p\_{l} = \epsilon \big( 1 - (1-p\_{l-1})^{(w\_{r} - 1)}\big)^{(w\_{c} -1)}
\end{equation}

Before the iteration, we have \\(p\_{0} = \epsilon\\) which is the probability that
a bit is erased by the channel.

Thus, for a \\((w\_{c},w\_{r})\\) regular ensemble, we have a recursion:

\begin{eqnarray}
\label{eq:3}
p\_{0}&=&\epsilon \newline
p\_{l}&=& \epsilon \big( 1 - (1-p\_{l-1})^{(w\_{r} - 1)}\big)^{(w\_{c} -1)}
\end{eqnarray}

The above recursion describes how the erasure probability of MPA evolves as a
function of the iteration number \\(l\\). For example, we can find that with
\\(\epsilon = 0.3\\) the decoder can correct the erasure after \\(l = 7\\). With \\(l
\to \infty\\), we find that \\(\epsilon \in (0.4293,0.4294)\\) is OK. So we can say
that the threshold for a \\((3,6)\\) regular LDPC code is between \\(0.4293\\) and
\\(0.4294\\).


### <span class="section-num">2.2</span> Irregular LDPC codes {#irregular-ldpc-codes}



For an irregular LDPC codes, the columns and rows have varying weights. So we
describe an irregular LDPC ensemble in a different way. We designated the
fraction of columns of weight \\(i\\) by \\(v\_{i}\\) and the fraction of rows of
weight \\(i\\) by \\(h\_{i}\\). An irregular LDPC ensemble can be described using
\\(v\_{i}\\) and \\(h\_{i}\\)

To develop the irregular version of density evolution, we define fraction of
edges connecting to degree-\\(i\\) bit nodes as \\(\lambda\_{i}\\) and \\(\rho\_{i}\\)
the fraction of edges connecting to degree-\\(i\\) check nodes.

It's easy to get:

\begin{eqnarray}
\label{eq:7}
\sum\_{i}\lambda\_{i}&=& 1 \newline
\sum\_{i}\rho\_{i} &=& 1
\end{eqnarray}

We also define the **degree distrubution functions** as:

\begin{eqnarray}
\label{eq:8}
\lambda(x)&=&\lambda\_{2} x + \lambda\_{3}x^{2} + \ldots + \lambda\_{i}x^{i-1} + \ldots \newline
\rho(x) &=& \rho\_{2}(x) + \rho\_{3}x^{2} + \ldots + \rho\_{i}x^{i-1} + \ldots
\end{eqnarray}

We can transform between node degrees and edge degrees by:

\begin{eqnarray}
\label{eq9}
v\_{i}&=& \frac{\lambda\_{i}/i}{\sum\_{j}\lambda\_{j}/j} \newline
h\_{i}&=& \frac{\rho\_{i}/i}{\sum\_{j}\rho\_{j}/j}
\end{eqnarray}

About the above equation, take
\\[v\_{i}=\frac{\lambda\_{i}/i}{\sum\_{j}\lambda\_{j}/j} \\] for example,
suppose the number of degree \\(i\\) bit nodes is \\(n\_{i}\\), so
\\(\lambda\_{i} = \frac{ n\_{i} i }{\sum\_{j}n\_{j}j} \\). Then

\begin{equation}
\label{eq:1}
\lambda\_{i}/i  = \frac{n\_{i}}{\sum\_{j}n\_{j}j}
\end{equation}

Thus,

\begin{equation}
\label{eq:9}
\sum\_{k}\lambda\_{k}/k = \sum\_{k} \frac{n\_{k}}{\sum\_{j}n\_{j}j}
\end{equation}

Then,

\begin{eqnarray}
\label{eq:10}
\frac{\lambda\_{i}/i}{\sum\_{k} \lambda\_{k}/k } &=& \frac{ \frac{n\_{i}}{\sum\_{j}n\_{j}j}  }{ \sum\_{k} \frac{n\_{k}}{\sum\_{j}n\_{j}j}} \newline
&=& \frac{n\_{i}}{\sum\_{k}n\_{k}} \newline
&=& v\_{i}
\end{eqnarray}

At the regular LDPC codes section, we get that, at the \\(l\\)
iteration of MPA decoding, the probability that C2B is \\(x\\), is:

\begin{equation}
\label{eq:11}
q\_{l} = 1- (1-p\_{l})^{(w\_{r} -1)}
\end{equation}

for an edge connected to a degree \\(w\_{r}\\) check node. When it comes
to an irregular Tanner graph, the probability that an edge is
connected to a degree \\(w\_{r}\\) check node is \\( \rho\_{w\_{r}} \\).

So,

\begin{equation}
\label{eq:12}
q\_{l} =\sum\_{i} \rho\_{i} ( 1 - (1-p\_{l})^{(i-1)} ) = 1 - \sum\_{i}\rho\_{i} (1-p\_{l})^{(i-1)}
\end{equation}

Before, we define

\begin{equation}
\label{eq:13}
\rho(x) = \rho\_{2}(x) + \rho\_{3}x^{2} + \ldots + \rho\_{i}x^{i-1} + \ldots
\end{equation}

So,

\begin{equation}
\label{eq:14}
q\_{l} = 1-\rho(1-p\_{l})
\end{equation}

Now, let's check the \\(p\_{l}\\). In the regular LDPC codes on BEC with
erasure probability \\(\epsilon\\), at the \\(l\\)-th iteration of MPA
decoding if all incoming messages are independent, is :

\begin{equation}
\label{eq:15}
p\_{l} = \epsilon (q\_{l-1})^{(w\_{c} -1)}
\end{equation}

When it comes to irregular LDPC codes with the probability that an
edge is connected to a bit node of degree \\(w\_{c}\\) is
\\(\lambda\_{w\_{c}}\\), the \\(p\_{l}\\) can be derived in a straightforward
way:

\begin{equation}
\label{eq:16}
p\_{l} = \epsilon\sum\_{i}\lambda\_{i} (q\_{l-1})^{i-1}
\end{equation}

We also have the definition of \\(\lambda(x)\\), So,

\begin{equation}
\label{eq:17}
p\_{l} = \epsilon \lambda(q\_{l-1})
\end{equation}

At last, we get

\begin{equation}
\label{eq:18}
p\_{l} = \epsilon \lambda \big( 1- \rho(1-p\_{l-1}) \big)
\end{equation}

with \\(p\_{0}=\epsilon\\)


## <span class="section-num">3</span> threshold and stability of density evolution on BEC {#threshold-and-stability-of-density-evolution-on-bec}



According to \ref{eq:18}, we can evaluate the ensemble code with given
degree distribution \\(\lambda,\rho\\) assuming that the graphs are
cycle free.

To examine the influence of \\(\epsilon\\), we define the function:

\begin{equation}
\label{eq:24}
f(p,\epsilon) = \epsilon\lambda(1- \rho(1-p))
\end{equation}

The erasure probability at iteration \\(l\\) is then

\begin{equation}
\label{eq:25}
p\_{l}(\epsilon) = f(p\_{l-1},\epsilon)
\end{equation}

\\(f(p,\epsilon)\\) is a strictly increasing function in \\(p\\) for
\\(\epsilon > 0\\) so \\(p\_{l+1} > p\_{l}\\).

In particular,

\begin{eqnarray}
\label{eq:26}
f(0,\epsilon)&=&\epsilon \lambda(1-\rho(1)) = 0 \\
f(1,\epsilon)&=&\epsilon \lambda(1-\rho(1-1)) = \epsilon
\end{eqnarray}

Since \\(f(p,\epsilon)\\) is a strictly increasing function in \\(p\\)

\begin{equation}
\label{eq:27}
0 \leq f(p,\epsilon) \leq \epsilon, \quad \forall p\in [0,1], \forall \epsilon\in [0,1]
\end{equation}

Thus, \\(p\_{\infty}\\) will definitely converges to an element
\\(p\_{\infty} \in [0,\epsilon]\\).Further, for a degree distribution
pair \\(\lambda,\rho\\) and an \\(\epsilon\in [0,1]\\), it can be proven
that if \\(p\_{l}(\epsilon) \to 0\\) then \\(p\_{l}(\epsilon^{'}) \to 0\\)
for all \\(\epsilon < \epsilon^{'}\\). Indeed, there is a value
\\(\epsilon^{\*}\\) called the threshold such that for values of
\\(\epsilon\\) below \\(\epsilon^{\*}\\), \\(p\_{l}\\) approaches zero as the
number of iterations goes to infinity while for values of \\(\epsilon >
\epsilon^{\*}\\) it does not. The threshold, \\(\epsilon^{\*}\\), for
\\((\lambda,\rho)\\) is defined as the supremum of \\(\epsilon\\) for
which \\(p\_{l}(\epsilon) \to 0\\):

\begin{equation}
\label{eq:28}
\epsilon^{\*} (\lambda,\rho) = \sup \{ \epsilon\in [0.1] :p\_{l}(\epsilon)\_{l\to \infty} \to 0 \}
\end{equation}

We wish to find the threshold of an irregular LDPC ensemble with
degree distributions:

\begin{equation}
\label{eq:29}
\lambda(x) = 0.1x + 0.4x^{2} + 0.5x^{19}
\end{equation}

and

\begin{equation}
\label{eq:30}
\rho(x) = 0.5 x^{7} + 0.5 x^{8}
\end{equation}

This code has rate:

\begin{equation}
\label{eq:31}
1- \frac{\sum\_{i}\lambda\_{i}/i}{\sum\_{i}\rho\_{i}/i} \approx 0.5
\end{equation}

By using the recursion of Density evolution, we find that the
threshold for this ensemble is an erasure probability between 0.465
and 0.475.

It is easy to find that the density evolution quickly results in very
high order as the iteration number is increased. However, to
understand its behavior when \\(p\_{l}\\) is small we can approximate it
by a Taylor series expansion of the right hand side around 0. i.e.

\begin{equation}
\label{eq:32}
p\_{l} = f(p\_{l-1},\epsilon)\approx f^{'}(p,\epsilon) p\_{l-1}
\end{equation}

A function \\(f(x) = g(h(x))\\) has a derivative with respect to \\(x\\)
given by:

\begin{equation}
\label{eq:34}
\frac{df}{dx} = \frac{dg}{dh} \frac{dh}{dx}
\end{equation}

Thus for:

\begin{equation}
\label{eq:35}
f(p,\epsilon) = \epsilon \lambda(h(p)) \quad h(p) = 1-\rho(1-p)
\end{equation}

the derivative with respect to \\(p\\) is :

\begin{equation}
\label{eq:36}
\frac{df(p,\epsilon)}{dp} = \frac{d\lambda}{dh} \frac{dh}{dp}
\end{equation}

Evaluating this derivative at \\(p = 0\\) we have that

\begin{equation}
\label{eq:37}
h(p=0) = 1-\rho(1) =0
\end{equation}

and so

\begin{equation}
\label{eq:38}
\frac{d\lambda}{dh}\bigg|\_{p=0} =  \lambda\_{2} + 2\lambda\_{3}h + \ldots + (i-1)\lambda\_{i}h^{(i-2)} + \ldots \bigg|\_{h=0} = \lambda\_{2}
\end{equation}

and

\begin{equation}
\label{eq:39}
\frac{dh}{dp}\bigg|\_{p=0} = \frac{d(1-\rho(1-p)}{dp} \bigg|\_{(1-p)=1} = \rho^{'}(1)
\end{equation}

So, we get:

\begin{equation}
\label{eq:40}
p\_{l} \approx \epsilon \lambda\_{2}\rho^{'}(1)p\_{l-1}, \quad p\_{l} \to 0
\end{equation}

For \\(p\_{l} \to 0\\) as \\(l\to \infty\\), must have \\(p\_{l} < p\_{l-1}
\\), and so requires:

\begin{equation}
\label{eq:41}
\epsilon \lambda\_{2}\rho^{'}(1) < 1
\end{equation}

So \\(\lambda\_{2}\\) is upper bounded by:

\begin{equation}
\label{eq:42}
\lambda\_{2} <  \frac{1}{\epsilon \rho^{'}(1)}
\end{equation}

We call (\ref{eq:42}) the _stability constraint_ of density evolution.


## <span class="section-num">4</span> Density evolution on general memoryless channels {#density-evolution-on-general-memoryless-channels}



On general memoryless channels, the B2C messages are the LLRs during
the MPA. We define LLR as

\begin{equation}
\label{eq:19}
L(x) = \log \big( \frac{p(x=0)}{p(x=1)} \big)
\end{equation}

So the sign of \\(L(x)\\) determine it is \\(0\\) or \\(1\\) and the
magnatue of \\(|L(x)|\\) tell us how sure we are about the decision.

Figure [1](#org23fcb38) shows a gaussian PDF for
\\(\mathcal{p}( r)\\) and the probability that the bit is "1" is the area
of the shade.

<a id="org23fcb38"></a>
{{< figure src="/img/telecommunication/20180205gaussian.png" caption="a Gaussian PDF" width="400" >}}

The LLR are real numbers, so it can be illustrated using a probability
density function. We define the PDF for a B2C message at iteration as
\\(p(M\_{l})\\) and C2B \\(p(E\_{l})\\). Also, \\(p( r)\\) as the PDF for the
LLR of the received signal corrupted by the channel. Also, we suppose
that the message along the edges are I.I.D (This constraint can can
be removed when it comes to MET-LDPC).

The output of a bit node is the sum of incoming LLRs on the other
edges into that node:

\begin{equation}
\label{eq:20}
M\_{j,i} = \sum\_{j^{'}\in A\_{i},j^{'}\neq j} E\_{j^{'},i} + r\_{i}
\end{equation}

The probability textbook told us that the PDF of summation of I.I.D random
variables is the convolution of the PDF of these random variables. So the PDF of
the B2C message can be expressed as:

\begin{equation}
p\_{M} = p( r) \otimes p(E\_{l})^{\otimes(w\_{c}-1)}
\end{equation}

Considering the irregular LDPC codes and the bit degree distribution
\\(\lambda(x)\\):

\begin{equation}
\label{eq:21}
p(M\_{l}) = p( r) \otimes\sum\_{i}\lambda\_{i} p(E\_{l})^{\otimes(i-1)} = p( r)\otimes \lambda^{\otimes}(p(E\_{l}))
\end{equation}

Now, there are many efficient ways to evaluate the convolution.

For belief propagation, the function to be evaluated at each check node is show
as below:

\begin{equation}
\label{eq:22}
E\_{j,i} = \log \big(  \frac{ 1+ \prod\_{i^{'}\in B\_{j,i^{'} \neq i} } tanh (M\_{j,i^{'}}/2)}{ 1- \prod\_{i^{'}\in B\_{j,i^{'} \neq i} } tanh (M\_{j,i^{'}}/2)} \big)
\end{equation}

So, to get the PDF of two messages \\(x\\) and \\(y\\), we have to caculate the
function:

\begin{equation}
\label{eq:23}
f(x,y) = \log \frac{ 1 + tanh(x/2) tanh(y/2) }{ 1- tanh(x/2)tanh(y/2)} = -\log \frac{ e^{x} + e^{y} }{ 1 + e^{x+y}}
\end{equation}

One simple way to use the density evolution on general channels is to assume tht
the original codeword was all zeros. So that the probability that the bit is in
error is the probability that the LLR is negative.

One more thing, although the PDFs at the beginning of iteration is Gaussian, the
result of the convolution of Gaussian PDFs is not Gaussian except in the limit.
However, for the sake of simplicity, we assume that after convolution the PDFs
remain Gaussian. The truth make Gaussian easy to use that we can use mean and
variance to describe Gaussian. So that we can only track the mean and variance
of the PDFs during the iteration.


### <span class="section-num">4.1</span> get an excellent degree distribution {#get-an-excellent-degree-distribution}



Using density evolution, we can analyze the threshold of an LDPC ensemble.
However, for a code designers, the question more urging is which degree
distribution will produce the best threshold.

In general, the more irregular, the better. Accroding to work of Sae-Young
Chung, Forney, Richardson and Urbanke, there is only an 0.0045dB gap between
Shannon limit and the irregular LDPC they designed. For that LDPC code, it has a
codewordlength of \\(10^{7}\\) and degree varying from 2 to 8000.

Because \\(H\\) is sparse, a large proportion of degree-2 bit nodes are required
to guarentee the low density. It can be shown that a degree distribution with a
good threshold will contain a few very high degree bit nodes, many degree two
nodes, but no more than allowed for by stability, and some nodes with degree
between these.


## <span class="section-num">5</span> Summary {#summary}



In this post, we analyze density evolution for regular and irregular
LDPC codes based on BEC and memoryless channel. As a tool for
designing and analyzing LDPC matrix, density evolution plays a
foundamental role and helps researchers find many LDPC matrices of
good performance.

However, the drawback of density evolution includes: 1. assumption of
cycle-free tanner graph, which is hard to be satisfied in reality; 2.
assumption of infinite length of codeword, which is also hard to be
satisfied; 3. extremely high computational complexity, which makes it
hard to use and results in many simplied and effective alternatives
which are out of this post's scope.

We will meet density evolution again!!!
