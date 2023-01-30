#lang sicp

(define nil '())
(define (same-parity s . l)
  (define (iter l)
    (cond ((null? l) nil)
          ((equal? (odd? (car l)) (odd? s)) (cons (car l) (iter (cdr l))))
          (else (iter (cdr l)))))
  (cons s (iter l)))

(same-parity 1)