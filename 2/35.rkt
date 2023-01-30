#lang sicp

(define nil '())
(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (inc y)) 0 (map (lambda (x) x) (enumerate-tree t))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define x (list 1 (list 2 3) (list 4) 5))

(count-leaves x)