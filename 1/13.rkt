#lang sicp

;; Use solutions: http://community.schemewiki.org/?sicp-ex-1.13.


;; 1. Insert our expression inside Fib(n) = Fib(n - 1) + Fib(+n), to prove Fib(n) equals to the expression.
;; 2. Find the boundaries of golden ratio (-1 < gr < 0 => -1 < gr^n < 1) and apply this ratio to proved expression.

;; 1. Prove base cases (0 and 1) for our expression.
;; 2. Prove inductive cases (as in step 1 in prev solution.
;; 3. Prove that abosulute value of diff between Fib(a) and our solution less than 1/2 (paste our expression and value inside Fib(n)).