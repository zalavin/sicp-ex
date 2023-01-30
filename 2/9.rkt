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
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define int1 (make-interval 2 5))
(define int2 (make-interval 3 7))

(define (width int)
  (/ (- (upper-bound int) (lower-bound int)) 2))

;; Width of sum depends on arguments.
;; i1 - (i11, i12)
;; i2 - (i21, i22)
;; w(i1) = (i12 - i11) / 2
;; i1 + i2 = (i11 + i21, i12 + i22)
;; w(i1 + i2) = ((i12 + i22) - (i11 + i21)) / 2  = (i12 - i11) / 2 + (i22 - i21) / 2 = w(i1) + w(i2)

(= (+ (width int1) (width int2)) (width (add-interval int1 int2)))

;; Width of product does not depend on its arguments.
;; Suppose: all are positive integers and i22 > i11.
;; i1 * i2 = (i11 * i21, i21 * i22)
;; w(i1 * i2) = (i21 * i22 - i11 * i21) / 2
;; w(i1) * w(i2) = ((i12 - i11) / 2) * ((i22 - i21) / 2) = ((i12 - i11) * (i22 - i21)) / 4
;; Therefore w(i1 * i2) != w(i1) * w(i2)

(= (* (width int1) (width int2)) (width (mul-interval int1 int2)))
