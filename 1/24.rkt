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

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

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

(define (timed-prime-test-fast n)
  (newline)
  (display n)
  (start-prime-test-fast n (runtime)))
(define (start-prime-test-fast n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))))

(define (search-for-primes n found)
  (if (< found 3)
      (if (prime? n)
          (and (timed-prime-test n) (search-for-primes (+ 1 n) (+ 1 found)))
          (search-for-primes (+ 1 n) found))))

(define (search-for-primes-fast n found)
  (if (< found 3)
      (if (fast-prime? n 100)
          (and (timed-prime-test-fast n) (search-for-primes-fast (+ 1 n) (+ 1 found)))
          (search-for-primes-fast (+ 1 n) found))))

(search-for-primes 1000 0)
(search-for-primes 10000 0)
(search-for-primes 100000 0)
(search-for-primes 1000000 0)
(search-for-primes 10000000 0)

(search-for-primes-fast 1000 0)
(search-for-primes-fast 10000 0)
(search-for-primes-fast 100000 0)
(search-for-primes-fast 1000000 0)
(search-for-primes-fast 10000000 0)

;; Log(1000) eq 6, Log(1000000) eq 13. So we expect approx double time increase, that acually occurs (3 vs 6) when n eq 3, and (80 vs 160) when 100.