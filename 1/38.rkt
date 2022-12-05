#lang sicp

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (d i)
  (if (= (remainder i 3) 2)
      (- i (floor (/ i 3.0)))
      1))

(d 1)
(d 2) ;; 2
(d 5) ;; 4
(d 8) ;; 6
(d 11) ;; 8

(cont-frac (lambda (i) 1.0)
           d
           10)

