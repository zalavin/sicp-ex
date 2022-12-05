#lang sicp

;; When we use square we cound expmod function only once and use this value to square.

;; When we use multiplication we generate a new calling tree.

;; The first case
;; expmod 3 8 8
;; expmod 3 4 8
;; expmod 3 2 8
;; expmod 3 1 8
;; expmod 3 0 8

;; The second case
;; expmod 3 8 8
;; expmod 3 4 8 - expmod 3 4 8
;; expmod 3 2 8 - expmod 3 2 8 - expmod 3 2 8 - expmod 3 2 8
;; expmod 3 1 8 - expmod 3 1 8 - expmod 3 1 8 - expmod 3 1 8 - expmod 3 1 8 - expmod 3 1 8 - expmod 3 1 8 - expmod 3 1 8;
;; So for every new level when we divide input by two we double callings to expmod resulting in O(n) calls.