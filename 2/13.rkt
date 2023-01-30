#lang sicp


;; Percentage tolerance is a number in percent (say px and py).
;; dx = x * (px / 100)
;; dy = y * (py / 100)
;; (x - dx, x + dx) and (y - dy, y + dy)
;; (x - dx) * (y - dy) = xy - xdy - ydx + dx*dy
;; (x + dx) * (y + dy) = xy + xdy + ydx + dx*dy
;; (xy + dxdy - xdy - ydx, xy + dxdy + xdy + ydx)
;; Say xy + dxdy = t: (t - xdy - ydx, t + xdy + ydx)
;; Total tolerance for multiplication is: xdy + ydx.
;; x * y * (py / 100) + y * x * (px / 100) = xy * (py + px / 100)