#lang sicp

(define (square x) (* x x))
(define (f g) (g 2))

(f square)

;; (f f)
;; This will call (f 2), which returns an error since g (that equals 2) is not a procedure.

(f f)