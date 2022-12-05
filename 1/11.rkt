#lang sicp

;; Recursive

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

;; Iterative

(define (fi n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))

(define (f-iter a b c n)
  (if (< n 3)
      a
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1))))


; Iterative one

(define (fio n)
  (define (f-i a b c count)
    (cond ((< n 3) n)
           ((<= count 0) a)
           (else (f-i (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
  (f-i 2 1 0 (- n 2)))

(f 5)
(fi 5)
(fio 5)