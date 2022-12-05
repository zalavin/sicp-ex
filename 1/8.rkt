#lang sicp

(define (cube-iter guess x)
  (display guess) (newline)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x) x)))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(cube-iter 2.0 27)