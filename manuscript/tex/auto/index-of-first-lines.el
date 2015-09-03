(TeX-add-style-hook
 "index-of-first-lines"
 (lambda ()
   (LaTeX-add-environments
    '("quotepage" LaTeX-env-args ["argument"] 1))))

