#lang sicp

(define (square n) (* n n))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

;; (define (alysa-expmod base exp m)
;;  (remainder (fast-exp base exp) m))

;; For the main case we have:
;; (b ^ e/2 % m) ^ 2 % m = (b ^ e/2 % m) * (b ^ e/2 % m) % m = (b ^ e/2 * b ^ e/2) % m = b ^ e % m
;; So the result should be the same.

;; Suppose we compute (expmod 3 4 4)
;; (rem (sq (expmod 3 2 4)) 4)
;; (rem (sq (rem (sq (expmod 3 1 4))) 4)) 4)
;; (rem (sq (rem (sq (rem (* 3 (expmod 3 0 4)) 4)) 4))
;; 1

;;

(expmod 1 4 4)

;; The problem is that we will operate with the larger numbers doing fast-exp without remainder.