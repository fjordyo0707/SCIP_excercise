#lang sicp
(define (fast-expt n b a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt (/ n 2) (* b b) a))
        (else (fast-expt (- n 1) b (* a b))) ))