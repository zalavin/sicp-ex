#lang sicp

(define (square n) (* n n))
(define (smallest-divisors n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= (smallest-divisors n) n))

(define (filtered-accumulate predicate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (predicate a) (term a) null-value)
       (filtered-accumulate predicate combiner null-value term (next a) next b))))

(define (prime-squares a b)
  (filtered-accumulate prime? + 0 square a inc b))

(prime-squares 1 5)

(define (self x) x)

(define (product-ints n)
  (define (rel-prime? i)
    (= (gcd i n) 1))
  (filtered-accumulate rel-prime? * 1 self 1 inc n))

(product-ints 8)