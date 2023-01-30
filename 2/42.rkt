#lang sicp

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
         (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)

(define (safe? k positions)
  (define (check el left)
    (if (null? left)
        #t
        (let ((nxt (car left))
              (diff (- (length positions) (length left))))
          (and (not (= el nxt))
               (not (= el (+ nxt diff)))
               (not (= el (- nxt diff)))
               (check el (cdr left))))))
  (check (car positions) (cdr positions)))

(define (adjoin-position new-row k rest-of-queens)
  (append (list new-row) rest-of-queens))

(queens 4)
