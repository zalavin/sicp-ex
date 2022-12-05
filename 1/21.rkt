#lang sicp

(define (square n) (* n n))
(define (smallest-divisors n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(smallest-divisors 199)
(smallest-divisors 1999)
(smallest-divisors 19999)
       