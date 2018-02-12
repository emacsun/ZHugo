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
    "sec:orgbbc628b"
    "sec:org6f7fbc3"
    "sec:org8d62867"
    "sec:org1bfdebc"
    "sec:org64d4ebb"
    "sec:orgc5304ec"
    "fig:orgc2408c5"
    "sec:orge006e2e"
    "sec:orgee2a024"
    "sec:org726b87b"
    "sec:org18bf082"
    "sec:orgeb209d7"
    "sec:org0db9df3"
    "sec:org805b3a5"
    "fig:org20736ea"
    "sec:org46d5ae2"
    "sec:orgf08662b"
    "sec:org7132f88"
    "sec:org02a2efa"
    "sec:org177a7fb"
    "fig:orga0e971b"
    "sec:org8896f18"
    "sec:org816a8dd"
    "sec:org0663888"
    "fig:org1e1ff04"
    "sec:orgc49f3c5"
    "fig:org81bfe22"
    "tab:org83d6383"
    "sec:org6c308ed"
    "sec:orgab8b182"
    "sec:org9f6b47a"
    "sec:org3d3aeec")
   (LaTeX-add-bibliographies
    "../../research_library/zcl"))
 :latex)

