#lang sicp

(define nil '())
(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
;; (/ 1 (/ 2 (/ 3 1))) => 3/2

(fold-left / 1 (list 1 2 3))
;; iter 1 (1 2 3)
;; iter (/ 1 1) (2 3)
;; iter (/ 1 2) (3)
;; iter (/ 1/2 3) ()
;; (/ (/ (/ 1 1) 2) 3) => 1/6

(fold-right list nil (list 1 2 3))
;; (list 1 (list 2 (list 3 nil)))
(fold-left list nil (list 1 2 3))
;; (list (list (list nil 1) 2) 3)

;; To guarantee that fold-right and fold-left will be the same, an op should not depend on order of arguments (i.e. be commutative).

(fold-right * 1 (list 1 2 3))
(fold-left * 1 (list 1 2 3))

(fold-right + 1 (list 1 2 3))
(fold-left + 1 (list 1 2 3))

(fold-right - 1 (list 1 2 3))
(fold-left - 1 (list 1 2 3))

