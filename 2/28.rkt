#lang sicp

(define nil '()) 

(define x (list (list 1 2) (list 3 4 (list 5 6))))

(define (fringe l)
  (cond ((null? l) nil)
        ((pair? l) (append (fringe (car l)) (fringe (cdr l))))
        (else (cons l nil))))

(fringe x)