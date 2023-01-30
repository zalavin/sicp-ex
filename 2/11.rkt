#lang sicp

(define (make-interval a b)
  (cons a b))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))

(define (add-interval a b)
  (make-interval (+ (lower-bound a) (lower-bound b))
                 (+ (upper-bound a) (upper-bound b))))

(define (mul-interval x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (cond ((< x2 0)
           (cond ((< y2 0) (make-interval (* x2 y2) (* x1 y1)))
                 ((> y1 0) (make-interval (* x1 y2) (* x2 y1)))
                 (else (make-interval (* x1 y2) (* x1 y1)))))
          ((> x1 0)
           (cond ((< y2 0) (make-interval (* x2 y1) (* x1 y2)))
                 ((> y1 0) (make-interval (* x1 y1) (* x2 y2)))
                 (else (make-interval (* x2 y1) (* x2 y2)))))
          (else
           (cond ((< y2 0) (make-interval (* x2 y1) (* x1 y1)))
                 ((> y1 0) (make-interval (* x1 y2) (* x2 y2)))
                 (else (make-interval (min (* x2 y1) (* x1 y2)) (max (* y1 y2) (* x2 y2)))))))))
           
                 

(define x (make-interval -2 5))
(define y (make-interval -4 8))

(mul-interval x y)


