#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(car (cons 1 2))
;; (cons 1 2) (lambda (p q) p)
;; (lambda (m) (m 1 2))
;; m = (lambda (p q) p)
;; m 1 2 = (p q) p = 1

(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 1 2))