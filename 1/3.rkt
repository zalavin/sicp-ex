#lang sicp

(define
  (three a b c)
  (cond ((and (<= a b) (<= a c)) (+ (* b b) (* c c)))
        ((and (<= b c) (<= b a)) (+ (* a a) (* c c)))
        (else (+ (* a a) (* b b)))))


(= (three 1 2 3) 13)
(= (three 3 2 1) 13)
(= (three 1 3 2) 13)
(= (three 1 1 1) 2)
(= (three 1 2 2) 8)
(= (three 1 1 2) 5)
(= (three 1 4 3) 25)