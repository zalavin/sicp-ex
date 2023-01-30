#lang sicp

;; This version is to pass Hexlet test. It gets a length and width in constructor.


(define (make-point x y)
  (cons x y))

#|
(define (make-rectangle p x y)
  (cons p (cons x y)))

(define (rect-length r)
  (car (cdr r)))

(define (rect-width r)
  (cdr (cdr r)))
|#

(define (rectangle-square r)
  (* (rect-width r) (rect-length r)))

(define (rectangle-perimeter r)
  (* (+ (rect-width r) (rect-length r)) 2))

(define start-point (make-point 0 0))
;; (define rectangle (make-rectangle start-point 2 3))



;; Suppose we change representation for rectangular to accept only points.

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-rectangle p1 p2 p3)
  (cons p1 (cons p2 p3)))

(define (rect-length r)
  (abs (- (x-point (car r)) (x-point (car (cdr r))))))

(define (rect-width r)
  (abs (- (y-point (car r)) (y-point (cdr (cdr r))))))

(define rectangle (make-rectangle start-point (make-point 2 0) (make-point 0 3)))

(rect-length rectangle)
(rectangle-square rectangle)
(rectangle-perimeter rectangle)
  