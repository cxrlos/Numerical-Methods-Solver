#lang racket

(require 2htdp/image)
(require 2htdp/universe)
 
; Constants
(define WIDTH 300)
(define HEIGHT 160)
(define MT (empty-scene WIDTH HEIGHT))
 
; next-size : Number -> Number
(define (next-size s)
  (/ s 2))

