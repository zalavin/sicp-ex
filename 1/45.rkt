#lang sicp

(define (average a b) (/ (+ a b) 2))
(define tolerance 0.0001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    ;; (display guess)(newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (square x) (* x x))
(define (cube x) (* x x x))

(define (average-dump f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (average-dump (lambda (y) (/ x y))) 1.0))

(define (cube-root x)
  (fixed-point (average-dump (lambda (y) (/ x (square y)))) 1.0))

;; (cube-root 27)

;; Square
;; y1 = x / y0
;; y2 = x / y1 = x / (x / y0) = y0

;; Cube
;; y1 = x / y0^2
;; y2 = x / y1^2 = x / (x / y0^2) ^ 2 = x / (x^2 + 2xy0^2 + y0^4)

(define (fourth-root x)
  (fixed-point (average-dump (average-dump (lambda (y) (/ x (cube y))))) 1.0))

;; (fourth-root (expt 3 4))

(define (repeated f n)
  (define (iter res i)
    (if (= i n)
        res
        (iter (f res) (+ i 1))))
  (lambda (x) (iter (f x) 1)))

(define (n-root n x)
;;  (let ((r (if (< n 3) 1 (- n 2))))
  (fixed-point ((repeated average-dump 7) (lambda (y) (/ x (expt y (- n 1))))) 1.0))

(define (test n x)
  (define (iter i)
    (display i)
    (display " — ")
    (display (n-root i (expt x i)))(newline)
    (if (< i n) (iter (inc i))))
  (iter 2))

;; (n-root 2 (expt 3 2))
;; (n-root 3 (expt 3 3))
;; (n-root 16 (expt 3 16))
;; (n-root 15 (expt 3 15))

(test 10 10)
