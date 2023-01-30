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

(define (div-interval x y)
  (if (or (= (lower-bound y) 0) (= 0 (upper-bound y))) (error "Interval spans zero"))
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

(define x (make-interval 1 2))
(define y (make-interval 3 4))

(par1 x y)
(par2 x y)
;; Yes, Lem is right.

(div-interval (make-interval 3 4) (make-interval 3 4))
;; When we divide A/A we do not get (1,1).

(mul-interval (div-interval (make-interval 1 1) x) x)
;; If we delete 1/x * x we do not get back 1.

(div-interval (make-interval 2.9 3.1) (make-interval 2.9 3.1))
;; From deleting same intervals we get back a closer value to 1 for a small tollerance.

(div-interval (make-interval 92.9 93.1) (make-interval 92.9 93.1))
;; If we decrease percentage tolerance we get back closer to 1 interval. 






