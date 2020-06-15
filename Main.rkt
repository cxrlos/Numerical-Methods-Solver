#lang racket

(require "Functions.rkt")
(require 2htdp/image)
(require data/monad)
(require megaparsack megaparsack/text)

(fprintf (current-output-port)"  ____________________________________________  \n")
(fprintf (current-output-port)"|                                              |\n")
(fprintf (current-output-port)"|                                              |\n")
(fprintf (current-output-port)"| Welcome! The functions will process shortly. |\n")
(fprintf (current-output-port)"|                                              |\n")
(fprintf (current-output-port)"  ____________________________________________  \n")
(fprintf (current-output-port)"\n")

(define si/p
    (do (char/p #\s)
        (char/p #\i)
        (char/p #\,)
        [x <- integer/p]
        (pure x)))

(define ko/p
    (do (char/p #\k)
        (char/p #\o)
        (char/p #\,)
        [x <- integer/p]
        (pure x)))

;;NOT WORKING (taken from https://docs.racket-lang.org/megaparsack/parsing-basics.html)
; (define add-two-ints/p
;     (do [x <- integer/p]
;         (char/p #\,)
;         [y <- integer/p]
;         (pure (+ x y))))

(define (multi-read in)
    (define line (read-line in))
    (if (eof-object? line)
        (display "Finished processing requests")
        (begin
            (cond 
                ((parse-string si/p line) (sierpinski-triangle (parse-string si/p line)))
                ((parse-string ko/p line) (koch-curve (parse-string ko/p line))))
            (multi-read in))))

(call-with-input-file "drawRequests.txt" multi-read)

(writeln 'Processing_Sierpinski...)
(define sierpinski_image (sierpinski 7))
(define sierpinski_back (rectangle (image-width sierpinski_image) (image-height sierpinski_image) "solid" "white"))
(save-svg-image (overlay/align "center" "bottom" sierpinski_image sierpinski_back) "sierpinski.svg")

(writeln 'Processing_Koch...)
(define koch_image (koch 6))
(define koch_back (rectangle (image-width koch_image) (image-height koch_image) "solid" "white"))
(save-svg-image (overlay/align "center" "bottom" koch_image koch_back) "koch.svg")

(fprintf (current-output-port)"\nAll done! The images will be contained where the scripts are located.")
