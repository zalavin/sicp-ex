#lang sicp

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

(define (iterative-improve f g)
  (lambda (x)
    (if (f x)
        x
        ((iterative-improve f g) (g x)))))

(define (sqrt x)
  ((iterative-improve
    (lambda (guess) (< (abs (- (square guess) x)) 0.001))
    (lambda (guess) (average guess (/ x guess)))
    )
   1.0))

(sqrt 25)


(define (fixed-point f first-guess)  
  ((iterative-improve
    (lambda (guess) (< (abs (- guess (f guess))) 0.001))
    f)
   first-guess))

 (fixed-point cos 1.0)

