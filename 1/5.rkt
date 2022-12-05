#lang sicp

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;; For applicative-order valuation: we evaluate our arguments and then apply to the operator.
(p) ; will be evaluated and never be terminated (since it references itself).


;; For normal-order variation: we fully expand and then apply.
((if (= 0 0) 0 (p)) ; we recieve 0, since p is not evaluated.