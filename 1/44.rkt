#lang sicp

(define (square x) (* x x))
(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (repeated f n)
  (define (iter res i)
    (if (= i n)
        res
        (iter (f res) (+ i 1))))
  (lambda (x) (iter (f x) 1)))

((smooth square) 5.5)
(((repeated smooth 10) square) 5.5)
(square 5.5)