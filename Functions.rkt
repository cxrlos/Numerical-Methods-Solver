#|------------------------------------------------- Functions.rkt ---------
    |   Purpose: Contains the algorithms for the functions called by the
    |       Main.rkt script. 
    |
    |   Functions:
    |       sierpinski - Receives the number of levels desired, outputs the
    |           respective Sierpinski fractal.
    |       koch - Receives the number of levels desired, outputs the
    |           respective Koch fractal.
    |
    |   Developers:  
    |       Carlos García - https://github.com/cxrlos
    |       Yann Le Lorier - https://github.com/yannlelorier
    |
    *--------------------------------------------------------------------|#

#lang racket
(provide sierpinski koch) ; Sends the functions to Main.rkt
(require 2htdp/image) ; Package for images


; --- NOTE ---
; Some functions were not seen in class but were found in the documentation
; https://docs.racket-lang.org/teachpack/2htdpuniverse.html
; https://docs.racket-lang.org/teachpack/2htdpimage-guide.html


; --- SIERPINSKI ---
(define (sierpinski levels)
  (if (not (zero? levels))
      
      ; Function used in 2htdp/image scenarios, adapted it to our reqs.
      (local
        
        ; Defines the next-level that the algorithm should process
        ((define next-level (sierpinski (- levels 1))))
        
        ; Places the triangles above and next to a reference triangle
        (above next-level (beside next-level next-level)))

      ; Base case, draws a triangle
      (triangle 20 "outline" "black")))



; --- KOCH --- 
(define (koch-helper n)
  (cond
    [(zero? n) (line 20 0 (pen "black" 8 "solid" "butt" "miter"))]
    [else
     (local [(define smaller (koch-helper (- n 1)))]
       (beside/align "bottom"
                     smaller
                     (rotate 60 smaller)
                     (rotate -60 smaller)
                     smaller))]))

(define  (koch n)
  (above
   (beside
    (rotate 60 (koch-helper 5))
    (rotate -60 (koch-helper 5)))
   (flip-vertical (koch-helper 5))))

