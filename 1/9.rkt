#lang sicp

(+ 4 5)

;; First procedure: (if (= a 0) b (inc (+ (dec a) b)))). It is recursive since it uses + operator inside the procedure and nesting result into expression.
(inc (+ (dec 4) 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; Second procedure: (if (= a 0) b (+ (+ (dec a) (inc b)))). This one is iterative since it just calls procedure with the updated value (like counter) and can be launched from any point of calculation.
(+ (dec 4) (inc 5))
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
(9)

