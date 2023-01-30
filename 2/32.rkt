#lang sicp

(define nil '())

(define x (list 1 2 3))


(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (append (list (car s)) x)) rest)))))

;; subsets returns a list of lists: (() (3) (2) (2 3))

;; Here we start from the last element (cdr of cdr etc in let).
;; Last one will be nil so we return (list nil) => () as a first element.
;; Lately we create append inside append, that for every stage doubles the answer.
;; (append rest map) implements an idea that for every new element in a combination we can:
;; either not to add it (rest is unchanged) or to add it (we append every list in rest to the new value).

;; (subsets x)

;; (subsets (list 1 2))
;; rest1 = (subsets (list 2))
;; rest2 = (subsets nil) = (list nil)
;; (subsets (list 2)) = (append (list nil) (list (append (list 2) nil)))
;; rest1 = (append (list nil) (list (append (list 2) nil))) = (() (2))
;; (subsets (list 1 2)) = (append rest1 (list (append (list 1) nil) (append (list 1) (list 2)))
;; (subsets (list 1 2)) = (() (2) (1) (1 2))

(subsets (list 1 2))
(append (list nil) (list (append (list 2) nil)))
(list (append (list 1) nil) (append (list 1) (list 2)))