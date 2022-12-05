#lang sicp

(define (double g)
  (lambda (x) (g (g x))))

((double inc) 1)
(((double (double double)) inc) 5) ;; 21
