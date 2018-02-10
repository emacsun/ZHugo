(TeX-add-style-hook
 "my-blog-workflow"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("org-article" "koma" "letterpaper" "captions=tableheading" "utopia" "11pt" "listings-sv" "microtype" "paralist" "colorlinks=true" "urlcolor=blue")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "org-article"
    "org-article11"
    "inputenc")
   (LaTeX-add-labels
    "sec:org4d209fb"
    "sec:org3bf4f8b"
    "sec:orgaf29280"
    "fig:org826ac59"
    "sec:org2d2747d"
    "sec:orgd46d7b7"
    "sec:orgdc7cb3a"
    "sec:orgf889efc"))
 :latex)

