#lang sicp

(define nil '())
(define (square x) (* x x)) 

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square-tree t)
  (cond ((null? t) nil)
        ((not (pair? t)) (square t))
        (else (cons (square-tree (car t)) (square-tree (cdr t))))))

(square-tree x)


