#lang sicp

(define (make-interval a b)
  (cons a b))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))

(define (make-center-percent c p)
  (let ((tol (* c (/ p 100.0))))
    (make-interval (- c tol) (+ c tol))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (- 100 (* 100 (/ (lower-bound i) (center i)))))

(percent (make-center-percent 100 5))


