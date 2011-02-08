#lang racket
;1.12

; recursive
(define (pascals-rec r c)
  (cond ((= r 0) 1)
        ((= c 0) 1)
        ((= r c) 1)
        (else (+ (pascals-rec (- r 1) c) (pascals-rec (- r 1) (- c 1))))
        )
  )

; tail recursive iteration
(define (next-row row) 
  (cons 1 (map (lambda (x y) (+ x y)) row (append (cdr row) '(0))))
  )
(define (pascals n) (pascals-prime n '(1)))
(define (pascals-prime n row)
  (cond ((= 0 n) row)
        (else (pascals-prime (- n 1) (next-row row)))
        )
  )