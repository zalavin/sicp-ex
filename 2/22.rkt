#lang sicp

#lang sicp

(define nil '())
(define (square a) (* a a))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things)) answer))))
  (iter items nil))

(square-list (list 1 2 3 4))

;; It is reversed because at every step answer is added to the end of cons: iter (1 2 3) () => iter(2 3) (cons (1^2) ()).

;; Interchaning arguments like this: (cons answer (square (car things))) does not help because here nil will be at the first place, so there will be list inside list etc.