#lang sicp

(define (square n) (* n n))
(define (smallest-divisors n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= (smallest-divisors n) n))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes n found)
  (if (< found 3)
      (if (prime? n)
          (and (timed-prime-test n) (search-for-primes (+ 1 n) (+ 1 found)))
          (search-for-primes (+ 1 n) found))))

(search-for-primes 1000 0)
(search-for-primes 10000 0)

;; Generally 10000 runs x3 times lower than 1000 (which equals sqrt 10).

(search-for-primes 100000 0)
(search-for-primes 1000000 0)

;; For higher numbers the diff is even more correct.

;; Generally, yes. We can say that machine run in time proportional to the number of steps.
