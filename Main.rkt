#lang racket

(require "Functions.rkt")
(require 2htdp/image)

(fprintf (current-output-port)"  ____________________________________________  \n")
(fprintf (current-output-port)"|                                              |\n")
(fprintf (current-output-port)"|                                              |\n")
(fprintf (current-output-port)"| Welcome! The functions will process shortly. |\n")
(fprintf (current-output-port)"|                                              |\n")
(fprintf (current-output-port)"  ____________________________________________  \n")
(fprintf (current-output-port)"\n")
(writeln 'Processing_Sierpinski...)
(define triangles (sierpinski 7))
(define bg1 (rectangle (image-width triangles) (image-height triangles) "solid" "white"))
(save-svg-image (overlay/align "center" "bottom" triangles bg1) "sierpinski.svg")

(writeln 'Processing_Koch...)
(define curve (koch 3))
(define bg (rectangle (image-width curve) (image-height curve) "solid" "white"))
(save-svg-image (overlay/align "center" "bottom" curve bg) "koch.svg")

(fprintf (current-output-port)"\nAll done! The images will be contained where the scripts are located.")