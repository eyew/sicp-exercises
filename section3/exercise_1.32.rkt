#lang racket
(define (inc x) (+ 1 x))
(define (identity x) x)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))
      )
  )

(define (accumulate-prime combiner partial term a next b)
  (if (> a b)
      partial
      (accumulate-prime combiner (combiner (term a) partial) term (next a) next b)
      )
  )
(define (accumulate-iter combiner null-value term a next b) 
  (accumulate-prime combiner null-value term a next b))

      
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))