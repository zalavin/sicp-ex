#lang sicp

(define nil '()) 

(define (reverse l)
  (define (iter l ans)
    (if (null? l)
        ans
        (iter (cdr l) (cons (car l) ans))))
  (iter l nil))

(reverse (list 1 2 3))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(append (list 1 2 3) (list 4 5 6))
(append (list 1 2 3) (cons 1 nil))





