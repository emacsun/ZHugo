+++
title = "toeplitz matrix"
author = ["Eason Zhang"]
date = 2018-03-14T19:53:00+08:00
lastmod = 2018-03-21T23:21:00+08:00
tags = ["math"]
draft = false
summary = "sommary of Toeplitz Matrix"
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

## Table of Contents

- <span class="section-num">1</span> [Toeplitz Matrices](#toeplitz-matrices)
- <span class="section-num">2</span> [Some Asymptotic Properties of Matrices](#some-asymptotic-properties-of-matrices)
    - <span class="section-num">2.1</span> [Eigenvalues](#eigenvalues)
    - <span class="section-num">2.2</span> [Matrix Norms](#matrix-norms)

</div>
<!--endtoc-->

For such a long time, I have it on my list to write something for
Toeplitz matrix. I want to derive the fundamental theorems on the
asymptotic behavvior of eigenvalues, inverses, and products of banded
Toeplitz matrices. To achieve this goal, I read the famous paper
_Toeplitz and Circulant Matrices: A review_ by Robert M. Gray
<sup id="ac945247a9e861b9ce0958daa357b943"><a href="#Gray_2005" title="Gray, Toeplitz and Circulant Matrices: A Review, {Foundations and Trends&#174; in Communications and Information
                  Theory}, v(3), 155&#8211;239 (2005).">Gray_2005</a></sup> . I am fond of matrices with the style like Toeplitz
matrices imagining that there must be something special existing in
the square matrices. During writing this post, Matlab is also used to
finish some mathematical test.


## <span class="section-num">1</span> Toeplitz Matrices {#toeplitz-matrices}



A Toeplitz matrix \\(T\\) is an square matrix with size \\(n\times n\\).
\\(T\_{n} = [t\_{k,j}; k,j= 0,1,\ldots,n-1]\\) where \\(t\_{k,j} =
t\_{k-j}\\).

In matrix form, A toeplitz matrix can be expressed as:

\begin{equation}
\label{eq:1}
T\_{n} =
\begin{pmatrix}
t\_{0} & t\_{-1} & t\_{-2} &\ldots & t\_{-(n-1)} \\\\\\
t\_{1} & t\_{0}  & t\_{-1} & \ldots &\vdots \\\\\\
t\_{2} & t\_{1}  & t\_{0} & \ldots &\vdots \\\\\\
\vdots & \vdots &\vdots & \ddots & \vdots \\\\\\
t\_{n-1} & \ldots & \ldots & \ldots & t\_{0}
\end{pmatrix}
\end{equation}

Because we dive into the details of Toeplitz matrix, some keypoints of
matrices are recaptured, such as the eigenvalues, Norms and
asymptotically equivalent matrices.


## <span class="section-num">2</span> Some Asymptotic Properties of Matrices {#some-asymptotic-properties-of-matrices}



Most often, we can study the asymptotic behavior of complicated
matrices by studying a more structured and simplier asymptotically
equivalent matirx. This method is used in many fields. A toy model is
studied comprehensively before a more complicated one comes in.


### <span class="section-num">2.1</span> Eigenvalues {#eigenvalues}



Scalor \\(\alpha\\) and vector \\(x\\) satisfied \\(Ax = \alpha x\\) are
called the eigenvalue and the corresponding eigenvector. We can get
the eigenvalues by solving

\begin{equation}
\label{eq:2}
\det(A-\alpha I) = 0
\end{equation}

For the sake of simplicity, we assume that the eigenvalues are ordered
in noincreasing format, i.e. \\(\alpha\_{1} > \alpha\_{2} > \ldots \\).

Any complex matrix \\(A\\) can be written as:

\begin{equation}
\label{eq:3}
A = URU^{\*}
\end{equation}

where the asterisk \\(\*\\) denotes conjugate transpose, \\(U\\) is
unitary, i.e., \\(U^{-1} = U^{\*}\\) and \\(R\\) is  an upper triangular
matrix. The eigenvalues of \\(A\\) are the principle diagonal elements
of \\(R\\). if \\(A\\) is normal, i.e. if\\(A^{\*}A = AA^{\*}\\), then \\(R\\) is
a diagonal matrix, which we denote as \\(R = diag(\alpha\_{k})\\). If
\\(A\\) is Hermitian, i.e. if \\(A^{\*} = A\\), then the eigenvalues are
real. If a matrix is Hermitian, then it is also normal.

For the case of Hermitian matrices, a useful description of the
eigenvalues is the variational description given by the
Courant-Fischer theorem.

<div class="corollary">
<div></div>

Define the Rayleigh quotient of an Hermitian matrix \\(X\\) and a vector
(complex \\(n\\)-tuple ) \\(x\\) by

\begin{equation}
\label{eq:4}
R\_{H}(x) = (x^{\*}Hx)/ (x^{\*}x)
\end{equation}

Let \\(\eta\_{M}\\) and \\(\eta\_{m}\\) be the maximum and minimum
eigenvalues of \\(H\\), respectively.

Then

\begin{eqnarray}
\label{eq:5}
\eta\_{m}&=& \min\_{x} R\_{H}(x) = \min\_{x:x^{\*}x = 1} x^{\*}Hx \\\\\\
\eta\_{M}&=& \max\_{x} R\_{H}(x) = \max\_{x:x^{\* }x = 1} x^{\*}Hx
\end{eqnarray}
</div>

This corollary will be useful in specifying the interval containing
the eigenvalues of an Hermitian matrix.

The following lemma is usefull when studying non-Hermitian matrices
and products of Hermitian matrices.

Let \\(A\\) be a matrix with eigenvalues \\(\alpha\_{k}\\). Define the
eigenvalues of the Hermitian matrix \\(A^{\*}A\\) to be \\(\lambda\_{k}\\).
Then:

\begin{equation}
\label{eq:6}
\sum\_{k=0}^{n-1} \lambda\_{k} \geq \sum\_{k=0}^{n-1}|\alpha\_{k}|^{2}
\end{equation}

with equality iff \\(A\\) is normal.

Proff. The trace of a matrix is the sum of the diagonal elements of a
matrix. The trace is invariant to unitary operations so that it also
is equal to the sum of the eigenvalues of amatrix. i.e.,

\begin{equation}
\label{eq:7}
Tr (A^{\*}A) = \sum\_{k=0}^{n-1}(A^{\*}A)\_{k,k}  = \sum\_{k=0}^{n-1} \lambda\_{k}
\end{equation}

We have

\begin{eqnarray\*}
Tr( \{A^{\*}A\} ) &=& Tr( \{R^{\*}R\} )  \\\\\\
&=& \sum\_{k=0}^{n-1}\sum\_{j=0}^{n-1} |r\_{j,k}|^{2} \\\\\\
&=& \sum\_{k=0}^{n-1} |\alpha\_{k}|^{2} + \sum\_{k\neq j} |r\_{j,k}|^{2} \\\\\\
&\geq& \sum\_{k=0}^{n-1} |\alpha\_{k}|^{2}
\end{eqnarray\*}


### <span class="section-num">2.2</span> Matrix Norms {#matrix-norms}



To study the asymptotic equivalence of matrices we require a metric or
equivalently a norm of the appropriate kind. Here we use two norms the
operator and the Hilbert-Schmidt. We call the former the strong norm
and later the weak norm.

Let \\(A\\) be a matrix with eigenvalues \\(\alpha\_{k}\\) and let
\\(\lambda\_{k}\\) be the eigenvalues of the Hermitian matrix \\(A^{\*}A\\).
The strong norm \\(\\|A\\|\\) is difined by:

\begin{equation}
\label{eq:8}
\\|A\\| = \max\_{x} R\_{A^{\*}A}(x)^{1/2} = \max\_{x:x^{\*}x=1} [x^{\*}A^{\*}Ax]^{1/2}
\end{equation}

According the corollary mentioned before, we have:

\begin{equation}
\label{eq:9}
\\|A\\|^{2} = \max\_{k}\lambda\_{k} = \lambda\_{M}
\end{equation}

The strong norm of \\(A\\) can be bounded below by letting \\(e\_{M}\\) be
the eigenvector of \\(A\\) corresponding to \\(\alpha\_{M}\\), the
eigenvalue of \\(A\\) having largest absolute value:

\begin{equation}
\label{eq:10}
\\|A\\|^{2} = \max\_{x:x^{\*}x = 1} x^{\*}A^{\*}Ax \geq (e\_{M}^{\*}A^{\*}) (Ae\_{M}) = |\alpha\_{M}|^{2}
\end{equation}

If \\(A\\) is itself Hermitian, then its eigenvalues \\(\alpha\_{k}\\) are
real and the eigenvalues \\(\lambda\_{k}\\) of \\(A^{\*}A\\) are simply
\\(\lambda\_{k} = \alpha\_{k}^{2}\\). This follows since if \\(e^{(k)}\\) is
an eigenvector of \\(A\\) with eigenvalue \\(\alpha\_{k}\\), then
\\(A^{\*}Ae^{(k)} = \alpha\_{k}A^{\*}e^{(k)} = \alpha\_{k}^{2}e^{(k)}\\).
Thus, in particular, if \\(A\\) is Hermitian then

\begin{equation}
\label{eq:11}
\\|A\\| = \max\_{k} |\alpha\_{k}| = |\alpha\_{M}|
\end{equation}

The Hilbert-Schmidt norm of an \\(n\times n\\) matrix \\(A =
\{a\_{k,j}\}\\) is defined by:

\begin{eqnarray\*}
|A| &=& \bigg(n^{-1}\sum\_{k=0}^{n-1} \sum\_{j=0}^{n-1} |a\_{k,j}|^{2}\bigg)^{\tfrac{1}{2}} \\\\\\
&=& \bigg(n^{-1} Tr[A^{\*}A] \bigg)^{\tfrac{1}{2}} \\\\\\
&=& \bigg( n^{-1} \sum\_{k=0}^{n-1} \lambda\_{k} \bigg)^{\tfrac{1}{2}}
\end{eqnarray\*}
