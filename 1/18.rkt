#lang sicp

(define (double x) (* x 2))
(define (halve x) (/ x 2))


(define (mult a b)
  (define (step n b a)
    (display (list n b a))(newline)
    (cond ((= n 0) a)
          ((even? n) (step (halve n) (double b) a))
          (else (step (- n 1) b (+ b a)))))

  (step b a 0))

(mult 7 10)