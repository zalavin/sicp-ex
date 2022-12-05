#lang sicp

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  ( / (+ x y) 2))


;; For a very small number the problem is in eps. If we increase it, we increase our precision.
(sqrt-iter 1.0 0.00000004)

;; For a large number if we increase our eps, the program can execute much longer (because floating point numbers has a limited number of bits and our eps can just not cover them).
(sqrt-iter 1.0 4000000000)
(sqrt-iter 1.0 1000000000000)

(define (sqrt-iter-alt guess x)
  (display guess) (newline)
  (if (good-enough-alt? guess x)
      guess
      (sqrt-iter-alt (improve guess x) x)))

; (define (good-enough-alt? guess x)
;   (< (/ (max (square guess) x) (min (square guess) x)) 1.00001))

; (define (good-enough-alt? guess x)
;   (= (improve guess x) guess))

(sqrt-iter-alt 1.0 0.00000004)
(sqrt-iter-alt 1.0 4000000000)