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


; --- NOTES ---
; Some functions were not seen in class but were found in the documentation
; [1] https://docs.racket-lang.org/teachpack/2htdpimage.html
; [2] https://docs.racket-lang.org/teachpack/2htdpuniverse.html
; [3] https://docs.racket-lang.org/teachpack/2htdpimage-guide.html

; To understand the behavior of the algorithms, the following resources were useful:
; https://www.geeksforgeeks.org/sierpinski-triangle/
; https://www.geeksforgeeks.org/koch-curve-koch-snowflake/


; --- SIERPINSKI ---
(define (sierpinski levels)
  ; Goes through the algorithm until it reaches the last level
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
(define (koch-helper levels) 
  ; Goes through the algorithm until it reaches the last level
  (if (not(zero? levels))

      (local 
        ; Defines the next-level that the algorithm should process
        ((define next-level (koch-helper (- levels 1))))
             
             ; Attaches the next-level triangles to the reference triangle
             ; beside/align function adapted from examples in [1]
             (beside/align "bottom"
                           next-level
                           (rotate 60 next-level)
                           (rotate -60 next-level)
                           next-level))

      ; Base case, draws a line with custom specifications
      ; See [1] for further customization 
      (line 25 0 (pen "black" 10 "solid" "round" "bevel"))))


(define (koch levels)
  ; The following creates what is known as Koch curves at different angles
  ; These curves combined create the snowflake
  (above (beside
          (rotate 60 (koch-helper levels))
          (rotate -60 (koch-helper levels)))
    ; Based on examples used at [1]
    (flip-vertical (koch-helper levels))))

