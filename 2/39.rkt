#lang sicp

(define nil '())

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

(define seq (list 1 2 3 4))

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (cons x nil))) nil sequence))

(reverse-right seq)

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

;; iter nil (1 2 3)
;; iter (op nil 1) (2 3) => iter (1) (2 3)
;; iter (op (1) 2) (3) => iter (2 1) (3)

(reverse-left seq)