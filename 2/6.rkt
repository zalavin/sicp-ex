#lang sicp

(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))



;; add-1 zero
;; n = (lambda (y) (lambda (x) x))
;; (lambda (f) (lambda (x) (f (((lambda (y) (lambda (x) x)) y) x)))))
;; f = inc (the function we apply)
;; x = 0 (to start with zero)
;; (lambda (y) (lambda (x) x)) y) => 0 (with inc and 0)
;; (inc 0)

(define (tr n)
  ((n inc) 0))

(tr zero)
(tr one)
(tr two)
(tr (add one one))
(tr (add one two))
