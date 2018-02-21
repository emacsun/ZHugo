(TeX-add-style-hook
 "tools"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("org-article" "koma" "letterpaper" "captions=tableheading" "ctex" "11pt" "listings-sv" "microtype" "paralist" "colorlinks=true" "urlcolor=blue")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "org-article"
    "org-article11")
   (LaTeX-add-labels
    "sec:org8e59bba"
    "sec:orgce4fea2"
    "sec:org6b6d51d"
    "sec:org8668a5f"
    "sec:org2f79c44"
    "sec:org6433732"
    "sec:orge4d3d3c"
    "tab:org58f1305"
    "sec:org174dd60"
    "sec:org3788acb"
    "sec:orgeb59021"))
 :latex)

