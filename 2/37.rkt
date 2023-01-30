#lang sicp

(define nil '())
(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define v (list 1 2 3))
(define w (list 4 5 6))
(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product v w)

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(matrix-*-vector m v)

(define (transpose mat)
  (accumulate-n (lambda (x y) (cons x y)) nil mat))

(transpose m)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(matrix-*-matrix m m)


