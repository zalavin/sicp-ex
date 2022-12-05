#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (self n) n)

(define (factorial n)
  (product self 1 inc n))

(factorial 5)

(define (wallis n)
  (define (next-a x)
    (if (even? (+ x 1))
        (+ x 1)
        (+ x 2)))
  (define (next-b x)
    (if (odd? (+ x 1))
        (+ x 1)
        (+ x 2)))
  (define (f x) (/ (next-a x) (next-b x)))
  (product f 1 inc n))

(* 4 (wallis 100))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(product-iter self 1 inc 5)