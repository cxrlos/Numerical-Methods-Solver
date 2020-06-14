#lang racket

(require 2htdp/image)
(require 2htdp/universe)
 
(define WIDTH 300)
(define HEIGHT 160)
(define MT (empty-scene WIDTH HEIGHT))
 
(define (next-size s)
  (/ s 2))

(define (circles x size screen)
  (beside/align "center"
                (circle size "outline" "dark blue")
                (circle (next-size size) "outline" "dark blue")))
      

