#lang sicp

(define (fast-expt b n)
  (define (iter b n c v)
    ; (display (list b n c v))(newline)
    (cond ((= n c) v)
          ((<= (* c 2) n) (iter b n (* c 2) (* v v)))
          (else (* v (iter b (- n c) 1 b)))))
  (iter b n 1 b))

(fast-expt 2 15)
           
(define (fast-expt2 b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter b (/ n 2) (* a a)))
          (else (iter b (- n 1) (* a b)))))
  (iter b n 1))

(fast-expt2 2 15)