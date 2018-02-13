(TeX-add-style-hook
 "testchinese"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("org-article" "koma" "letterpaper" "captions=tableheading" "ctex" "11pt" "listings-sv" "microtype" "paralist" "colorlinks=true" "urlcolor=blue")))
   (TeX-run-style-hooks
    "latex2e"
    "org-article"
    "org-article11"))
 :latex)

