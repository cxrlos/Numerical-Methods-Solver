#|------------------------------------------------- Functions.rkt ---------
    |   Purpose: Reads the input file, stores it and calls the functions.
    |
    |   Functions:
    |       lines->list - Reads the file ans stores it into a list.
    |       generate_fractals - Calls the functions from Functions.rkt
    |
    |   Developers:  
    |       Carlos García - https://github.com/cxrlos
    |       Yann Le Lorier - https://github.com/yannlelorier
    |
    *--------------------------------------------------------------------|#

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

; Function to read the file and store it in a list
; Written by Gilberto Echeverria https://github.com/gilecheverria/
(define (lines->list in)
    (let loop
        ([result empty])
        (define line (read-line in))
        (if (eof-object? line)
            result
            ; Each line contains a number, so it must be converted
            (loop (append result (list (string->number line)))))))

; Main driver function, receives the .xtt configuration file
(define (generate_fractals input_file)
    (define data (call-with-input-file input_file lines->list))
    
    (writeln 'Processing_Koch...)
    (define koch_image (koch (list-ref data 1)))
    (define koch_back (rectangle (image-width koch_image) (image-height koch_image) "solid" "white"))
    (save-svg-image (overlay/align "center" "bottom" koch_image koch_back) "koch.svg")

    (writeln 'Processing_Sierpinski...)
    (define sierpinski_image (sierpinski (list-ref data 3)))
    (define sierpinski_back (rectangle (image-width sierpinski_image) (image-height sierpinski_image) "solid" "white"))
    (save-svg-image (overlay/align "center" "bottom" sierpinski_image sierpinski_back) "sierpinski.svg")

    (fprintf (current-output-port)"\nAll done! The images will be contained where the scripts are located.\n\n"))
