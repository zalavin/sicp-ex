#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (self n) n)

(define (sum term a next b)
  (accumulate + 0 term a next b))

(sum self 1 inc 10)

(define (product term a next b)
  (accumulate * 1 term a next b))

(product self 1 inc 10)

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(sum-iter self 1 inc 10)

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(product-iter self 1 inc 10)