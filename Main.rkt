#lang racket

(require "Functions.rkt")
(require 2htdp/image)
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

; (define req/p
;     (do [x <- letter/p]
;         (space/p)
;         [y <- integer/p]
;         (pure (+ x y))))

(define (lines in)
    (let loop
        ([iter 0])
        (define line (read-line in))
        (if (eof-object? line)
            result
            ; Each line contains a number, so it must be converted
            (cond 
                [(parse-string si/p line) (loop (parse-string si/p line))]
                [(parse-string ko/p line) (loop (parse-string ko/p line))]))))


(define triangles (sierpinski-triangle 3))
(define bg1 (rectangle (image-width triangles) (image-height triangles) "solid" "black"))
(save-svg-image (overlay/align "center" "bottom" triangles bg1) "sierpinski.svg")

(define curve (koch-curve 5))
(define bg (rectangle (image-width curve) (image-height curve) "solid" "black"))
(save-svg-image (overlay/align "center" "bottom" curve bg) "koch.svg")
