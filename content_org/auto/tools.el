(TeX-add-style-hook
 "tools"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("org-article" "koma" "letterpaper" "captions=tableheading" "utopia" "11pt" "listings-sv" "microtype" "paralist" "colorlinks=true" "urlcolor=blue")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "org-article"
    "org-article11"
    "inputenc")
   (LaTeX-add-labels
    "sec:org64252d6"
    "sec:org7ceefeb"
    "sec:orgec6456d"
    "sec:orgce452fd"
    "fig:org69c907c"
    "sec:orgc84c4a7"
    "sec:org9f04fad"
    "sec:org291cdae"
    "sec:org43f0926"
    "sec:orgc9cc0b7"
    "sec:orgce07ab2"
    "sec:org3a870be"
    "sec:org6ca0e15"
    "sec:org4ff4fdb"
    "fig:org57dd463"
    "sec:orgd46e74d"
    "sec:orgb8980ae"
    "sec:org732e8f6"
    "sec:org91ea174"
    "sec:orgfe91429"))
 :latex)

