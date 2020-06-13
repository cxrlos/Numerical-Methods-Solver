#| 
---------------------------------------------------- NMSolver.rkt ---------
    |   Purpose: Serves as the main function, reads the file from the 
    |       .txt input file and then runs the Gillespie algorithm through
    |       the described graph. Throughout the script there are multiple
    |       functions that are described in the following lines.
    |
    |   Functions:
    |       main() - Main driver function
    |       menu() - Runs the selection menu.
    |       readGraph() - Reads the .txt file.
    |       nodeCoordinates() - Based on the number of nodes, it assigns a
    |           set of coordinates for each node.
    |       setRandomInfected() - Sets a random number of nodes to be 
    |           infected and randomly chooses nodes to set the respective
    |           status.
    |       gillespie() - Runs the Gillespie algorithm over the graph. The
    |           inputs are the following: the graph, recovery rate (gamma),
    |           initial infections and max number of iterations for the
    |           simulation.
    |       getAtRisk() - Calculates if a node is next to an infected
    |           neighbor.
    |       getInfected() - Calculates if a node is infected.
    |
    |   Developers:  
    |       Carlos García - https://github.com/cxrlos
    |       Yann Le Lorier - https://github.com/yannlelorier
    |
    *---------------------------------------------------------------------
|#


#lang racket
(define (find-roots f a b 
                    #:divisions [N 1]
                    #:method [method bisection])
  (define h (/ (- b a) N))
  (for*/list ([x1 (in-range a b h)] 
              [x2 (in-value (+ x1 h))]
              #:when (or (root? f x1)
                         (includes-root? f x1 x2)))
    (find-root f x1 x2 #:method method)))
 
(define (find-root f a b #:method [method bisection])
  (cond 
    [(root? f a) a]
    [(root? f b) b]
    [else (and (includes-root? f a b) (method f a b))]))
 
(define (root? f x) (almost-equal? 0 (f x)))
 
(define (includes-root? f a b) (< (* (f a) (f b)) 0))
 
(define (almost-equal? a b)
  (or (< (abs (+ b a)) (tolerance))      
      (< (abs (/ (- b a) (+ b a))) (tolerance))))
 
(define tolerance (make-parameter 5e-16))

(define (f x)
  (+ (* x x x) (* -3.0 x x) (* 2.0 x))
  )

(define (bisection f x1 x2)
  (let divide ([a x1] [b x2])
    (and (<= (* (f a) (f b)) 0)
         (let ([c (* 0.5 (+ a b))])
           (if (almost-equal? a b) 
               c
               (or (divide a c) (divide c b)))))))

