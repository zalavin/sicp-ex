#lang sicp

;; For 2^a * 3^b every combination of (a,b) will result in a unique integer.
;; Generally it is because every number is prime and they will never be equal to each other (expt 2 always produces even number, whereas expt 3 odd).
;; a = log2(x/3^b)
;; By contradiction: we believe there is a b' such that: log2(x/3^b') is an integer.
;; X is a combination of 2(0..n) * 3(0..n). So after x/3^b' there should only left 2(0..n) which could happen only if we eliminate all the 3s.

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (extract n q res)
  (if (and (> n 0) (= (remainder n q) 0))
      (extract (/ n q) q (inc res))
      res))

(define (car p)
  (extract p 2 0))

(define (cdr p)
  (extract p 3 0))
  
(cdr (cons 10 2))