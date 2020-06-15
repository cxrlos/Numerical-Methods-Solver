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
(define sierpinski_image (sierpinski 7))
(define sierpinski_back (rectangle (image-width sierpinski_image) (image-height sierpinski_image) "solid" "white"))
(save-svg-image (overlay/align "center" "bottom" sierpinski_image sierpinski_back) "sierpinski.svg")

(writeln 'Processing_Koch...)
(define curve (koch 6))
(define bg (rectangle (image-width curve) (image-height curve) "solid" "white"))
(save-svg-image (overlay/align "center" "bottom" curve bg) "koch.svg")

(fprintf (current-output-port)"\nAll done! The images will be contained where the scripts are located.")
