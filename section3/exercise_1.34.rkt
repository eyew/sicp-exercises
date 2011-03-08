#lang racket
(define (f g)
  (g 2))

;procedure f just adds a lazy eval of procedure g applied to 2
;the procedural argument g must be a function of a single non-procedural variable
;in this case the interpreter chokes on applying argument 2 as a function