#lang sicp

(define nil '())
(define (square x) (* x x)) 

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square-tree t) (tree-map square t))

(define (tree-map f t)
  (cond ((null? t) nil)
        ((not (pair? t)) (f t))
        (else (cons (tree-map f (car t)) (tree-map f (cdr t))))))

(square-tree x)


