#lang sicp

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (no-more? l)
  (null? l))

(define (except-first-denomination l)
  (cdr l))

(define (first-denomination l)
  (car l))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(cc 5 (list 1 5 10 25 50))
(cc 5 us-coins)

;; If we change order result will be the same since we reach all coins.
