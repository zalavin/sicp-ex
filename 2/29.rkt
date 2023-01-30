#lang sicp

(define nil '()) 

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

#|
(define (make-branch length structure)
  (cons length structure))

(define (make-mobile left right)
  (cons left right))

(define (branch-structure b)
  (cdr b))

(define (right-branch mob)
  (cdr mob))
|#


(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mob)
  (car mob))

(define (right-branch mob)
  (cadr mob))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (cadr b))

(define (total-weight mob)  
  (define (weight b)
    (let ((bs (branch-structure b)))
      (if (pair? bs)
          (total-weight bs)
          bs)))
  (+ (weight (left-branch mob)) (weight (right-branch mob))))

(define (mobile-balanced? mob)
  (define (weight b)
    (let ((bs (branch-structure b)))
      (if (pair? bs)
          (total-weight bs)
          bs)))
  (define (torque b)
    (* (branch-length b) (weight b)))
  (define (check mob)
    (let ((lb (left-branch mob))
          (rb (right-branch mob)))
      (and (= (torque lb) (torque rb))
           (or (not (pair? (branch-structure lb))) (mobile-balanced? (branch-structure lb)))
           (or (not (pair? (branch-structure rb))) (mobile-balanced? (branch-structure rb))))))
  (check mob))


(define nested-left-branch (make-branch 4 5))
(define nested-right-branch (make-branch nested-left-branch (make-branch 6 7)))
(define left (make-branch 1 2))
(define right (make-branch 3 nested-right-branch))
(define mobile (make-mobile left right))
(define mobile2 (make-mobile (make-branch 5 2) (make-branch 1 10)))
(define mobile3 (make-mobile (make-branch 5 2) (make-branch 5 (make-mobile (make-branch 1 1) (make-branch 5 1)))))

(left-branch mobile)
(right-branch mobile)
(branch-length left)
(branch-structure left)

(total-weight mobile)
(total-weight mobile2)

(mobile-balanced? mobile2)
(mobile-balanced? mobile)
(mobile-balanced? mobile3)

;; If we change constructors, I guess we need to change only 2 branch getters to make everything work: branch-structure and right-branch.
;; We can say that we have created an abstraction barrier.


