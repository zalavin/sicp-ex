#lang sicp

;; 11 -> 10c+1 -> 1c
;; 11 -> 5c+6 -> 5c+5c -> 5c+5c+1c
;; 11 -> 5c+6 -> 5c+1c+5 -> ... -> 5c+6*1c
;; 11 -> 1c+10 -> ... -> 11*1c

;; As the amount to be changed increased:
;; Space -> min space is n, because of 1c, but all every node will be computent independently.
;; Steps -> n^5, cause for kinds = 1 we have n calls, when we add a another kind we split our task into two (n, k1) and (n-5, k2)