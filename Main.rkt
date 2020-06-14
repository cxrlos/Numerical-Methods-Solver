#lang racket

(require "Functions.rkt")
(require 2htdp/image)

(define triangles (sierpinski-triangle 3))
(define bg1 (rectangle (image-width triangles) (image-height triangles) "solid" "black"))
(save-svg-image (overlay/align "center" "bottom" triangles bg1) "sierpinski.svg")

(define curve (koch-curve 5))
(define bg (rectangle (image-width curve) (image-height curve) "solid" "black"))
(save-svg-image (overlay/align "center" "bottom" curve bg) "koch.svg")
