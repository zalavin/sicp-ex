#lang sicp

(define x (list 1 2 3))
(define y (list 4 5 6))

;; append: (1 2 3 4 5 6)
;; cons: ((1 2 3) . (4 5 6)) => ((1 2 3) 4 5 6)
;; list: (1 2 3 (4 5 6)) => ((1 2 3) (4 5 6))

;; (list 1) => (cons 1 nil)
;; (list 2) => (cons 2 nil)
;; (cons l1 l2) => (cons (cons 1 nil) (cons 2 nil))

;; (list 1 2) => (cons 1 (cons 2 nil))
;; (list l1 l2) => (cons l1 (cons l2 nil)) => (cons (cons 1 nil) (cons (cons 2 nil) nil))

(append x y)
(cons x y)
(list x y)