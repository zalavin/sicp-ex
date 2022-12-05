#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))



(gcd 206 40)

;; For normal-order valuation we start by fully expanding the expression and only after this calculating it.
;; (gcd 206 40)
;; (gcd 40 (rem 206 40)) -> call 1 time to check b
;; (gcd (rem 206 40) (rem 40 (rem 206 40))) -> 2 times
;; (gcd (rem 40 (rem 206 40)) (rem ((rem 206 40) (rem 40 (rem 206 40)))) -> 4
;; (gcd (rem ((rem 206 40) (rem 40 (rem 206 40))) (rem (rem 40 (rem 206 40)) (rem ((rem 206 40) (rem 40 (rem 206 40)))) -> 7 to find b = 0 and 4 to find a
;; Totally: 18 calls.


;; For applicative-order evaluation we first evaluate the arguments and lately apply the function.
;; (gcd 206 40)
;; (gcd 40 (rem 206 40)) -> (gcd 40 6)
;; (gcd 6 (rem 40 6) -> (gcd 6 4)
;; So it's 5 calls to remainder.