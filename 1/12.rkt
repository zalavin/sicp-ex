#lang sicp

(define (pascal row)
  (define (p r c)
    (if (or (= 1 c) (= r c))
        1
        (+ (p (- r 1) (- c 1)) (p (- r 1) c))))
  (define (compute r c)
    (display (p r c))
    (display " ")
    (cond ((> r c) (compute r (+ c 1)))))
        
        

  (compute row 1))
    
    

(pascal 6)