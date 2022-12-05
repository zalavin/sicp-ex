#lang sicp

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mult a (halve b))))
        (else (+ a (mult a (- b 1))))))

(mult 7 7)