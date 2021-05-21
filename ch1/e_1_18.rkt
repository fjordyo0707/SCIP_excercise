#lang sicp
(define (fast-mul n b a)
  (cond ((= n 0) a)
        ((even? n) (fast-mul (/ n 2) (+ b b) a))
        (else (fast-mul (- n 1) b (+ a b))) ))