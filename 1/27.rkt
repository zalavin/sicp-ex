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

(define (test-carmichael n)
  (define (test n i)
    (if (< i n)
      (if (= (expmod i n n) i)
          (test n (+ i 1))
          false)
      true))
        
  (test n 1))

(test-carmichael 561)
(test-carmichael 1105)
(test-carmichael 1729)
(test-carmichael 2821)
(test-carmichael 6601)