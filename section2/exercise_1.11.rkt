#lang racket
;1.11

; f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3

; recursive
(define (f n)
  (cond ((< n 3) 3)
        (else (+ (f (- n 1)) (+ ( * 2 (f (- n 2))) (* 3 (f (- n 3))))))
        )
  )

; iterative
(define (f-iter-entry n)
  (f-iter n 0 3 3 3 0))
(define (f-iter n i a b c sum)
  (cond ((< n 3) 3)
        (( = (- n i) 3) (+ (+ c (* 2 b)) (* 3 a)))
        (else (f-iter n (+ 1 i) b c sum (+ sum (+ (+ c (* 2 b)) (* 3 a)))))
        )
  )

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)

(f-iter-entry 0)
(f-iter-entry 1)
(f-iter-entry 2)
(f-iter-entry 3)
(f-iter-entry 4)