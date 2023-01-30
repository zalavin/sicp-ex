#lang sicp

(define l1 (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr l1)))))

(define l2 (list (list 7)))
(car (car l2))

(define l3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
l3
(car l3)
(cdr l3)
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr l3))))))))))))

;; Check why we do I need another car.

(define tmp (list 1 (list 2)))
tmp

(cons 1 (cons (cons 2 nil) nil))