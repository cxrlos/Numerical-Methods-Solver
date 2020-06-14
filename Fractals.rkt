#lang racket
(provide sierpinski-triangle koch-curve)
(require 2htdp/image)
(define (sierpinski-triangle l)
  (if (<= l 4)
      (triangle l "outline" "white")
      (local [(define sub (sierpinski-triangle (/ l 2)))]
        (overlay (triangle l "outline" "white")
                 (above sub
                        (beside sub sub))))))



(define (koch-curve n)
  (cond
    [(zero? n) (line 20 0 (pen "white" 8 "solid" "butt" "miter"))]
    [else
     (local [(define smaller (koch-curve (- n 1)))]
       (beside/align "bottom"
                     smaller
                     (rotate 60 smaller)
                     (rotate -60 smaller)
                     smaller))]))
