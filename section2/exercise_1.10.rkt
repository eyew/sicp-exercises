#lang racket
;1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

;(define (f n) (A 0 n))
; f(n) = 2n

;(define (g n) (A 1 n))
;(A 1 3)
;(A 0 (A 1 2))
;(A 0 (A 0 (A 1 1)))
;(A 0 (A 0 2))
;(A 0 4)
;(8)
; g(n) = 2^n

;(define (h n) (A 2 n)) 
;(A 2 3)
;(A 1 (A 2 2))
;(A 1 (A 1 (A 2 1)))
;(A 1 (A 1 2)) <---
;(A 1 (A 0 (A 1 1))
;(A 1 (A 0 2)
;(A 1 4)
;(A 0 (A 1 3))
;(A 0 (A 0 (A 1 2))) <---
;(A 0 (A 0 (A 0 (A 1 1))))
;(A 0 (A 0 (A 0 2)))

; factor n iterates how many times you see an (A 1 2) exponentiation by 2 term
; as derived in g(n)
; h(n) = 2 exponentatied by 2 (n-1) times = tetration

;(define (k n) (* 5 n n))
; k(n) = 5n^2