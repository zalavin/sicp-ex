#lang sicp

(define (square n) (* n n))
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))
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

(search-for-primes 100000000 0)

;; An average is about 80 vs 110. Not twice, but 1,5. Guess, the problem is in runtime functions since it is not so pure to count steps. Also the problem is in if.