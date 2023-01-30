#lang sicp

; (or (and (< n 0) (< d 0)) (and (>= n 0) (>= d 0)))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (or (and (< n 0) (< d 0)) (and (>= n 0) (>= d 0)))
      (cons (abs (/ n g)) (abs (/ d g)))
      (cons (- (abs (/ n g))) (abs (/ d g))))))

(make-rat 1 2)
(make-rat -1 2)
(make-rat -1 -2)
(make-rat 1 -2)