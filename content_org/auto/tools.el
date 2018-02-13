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
    "sec:org2003146"
    "sec:orge3e3ed5"
    "sec:orgae68f6d"
    "sec:org45ba521"
    "sec:org7a44f45"
    "sec:org55e17b2"
    "fig:org35b1e55"
    "sec:orgd75fe39"
    "sec:org1bad030"
    "sec:org2a79e55"
    "sec:orgf625f5f"
    "sec:orgdac3197"
    "sec:orgaac6ebb"
    "sec:orga4027d0"
    "fig:orga8bf26a"
    "sec:org02165a9"
    "sec:org6b48ca2"
    "sec:org14c597b"
    "sec:orgf52f1e1"
    "sec:org19f197c"
    "fig:orgd9b1a38"
    "sec:orga0fbf15"
    "sec:org2714363"
    "sec:org6e6e185"
    "fig:org4192e91"
    "sec:orgb33db4a"
    "fig:org593dd20"
    "tab:org82d214b"
    "sec:org53596f2"
    "sec:orgb27471d"
    "sec:org8c30137"
    "sec:org5b3c301")
   (LaTeX-add-bibliographies
    "../../research_library/zcl"))
 :latex)

