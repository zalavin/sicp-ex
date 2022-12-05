#lang sicp

;; (sine 12.15)
;; (p (sine 4.05))
;; (p (p (sine 1.35)))
;; (p (p (p (sine 0.45))))
;; (p (p (p (p (sine 0.15)))))
;; (p (p (p (p (p (sine 0.05))))))
;; (p (p (p (p (p 0.05)))))


;; a) For every calling of sine we reduce output by 3 times, calling then function p exactly 5 times.
;; b) In space we have O(n) since we need to track recursion values in stack.
;; In steps for every calculation we reduce the size in 3 times, therefore (because we invoke only with power of 3: 3, 9, 27) it is O(log(n)).