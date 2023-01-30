#lang sicp

(define nil '())

(define (for-each f l)
  (cond ((not (null? l))
         (f (car l))
         (for-each f (cdr l)))))

(for-each (lambda (x) (display x)) (list 1 2 3))