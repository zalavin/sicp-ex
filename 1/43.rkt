#lang sicp

(define (square x) (* x x))
(define (repeated f n)
  (define (iter res i)
    (if (= i n)
        res
        (iter (f res) (+ i 1))))
  (lambda (x) (iter (f x) 1)))

((repeated square 2) 5)