#lang racket

(require "Functions.rkt")
(require 2htdp/image)
(require data/monad)
(require megaparsack megaparsack/text)

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

(define triangles (sierpinski-triangle 3))
(define bg1 (rectangle (image-width triangles) (image-height triangles) "solid" "black"))
(save-svg-image (overlay/align "center" "bottom" triangles bg1) "sierpinski.svg")

(define curve (koch-curve 5))
(define bg (rectangle (image-width curve) (image-height curve) "solid" "black"))
(save-svg-image (overlay/align "center" "bottom" curve bg) "koch.svg")
