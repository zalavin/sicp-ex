#lang sicp

(define nil '()) 

(define (reverse l)
  (define (iter l ans)
    (if (null? l)
        ans
        (iter (cdr l) (cons (car l) ans))))
  (iter l nil))

(define x (list (list 1 2) (list 3 4)))
(reverse x)

(define (deep-reverse l)
  (define (rev el)
    (if (pair? (car el))
         (deep-reverse (car el))
         (car el)))

  (define (iter l ans)
    (if (null? l)
        ans
        (iter (cdr l) (cons (rev l) ans))))

  (iter l nil))

(deep-reverse x)