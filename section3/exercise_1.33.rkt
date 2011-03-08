#lang racket
(define (square x) (* x x))
(define (inc x) (+ 1 x))
(define (identity x) x)

(define (filtered-accumulate filter combiner null-value term a next b)
    (if (> a b)
      null-value
      (combiner (if (filter a) (term a) null-value) 
                (filtered-accumulate filter combiner null-value term (next a) next b)
                )
      )
  )

(define (prime? x) #t)
(define (square-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (rel-prime? x) (lambda (y) (= 1 (gcd x y))))
(define (prod-rel-prime n)
  (filtered-accumulate (rel-prime? n) * 1 identity 1 inc n))
