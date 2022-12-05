#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (cube n) (* n n n))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(define (simpson f a b n)
  (define (h) (/ (- b a) n))
  (define (mult x)
    (cond ((or (= x 0) (= x n)) 1)
          ((= 0 (remainder x 2)) 2)
          (else 4)))
  (define (term k)
    (* (mult k) (f (+ a (* k (h))))))
  (* (/ (h) 3) (sum term 0 inc n)))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)