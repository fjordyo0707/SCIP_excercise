#lang sicp
(define (compose f g) (lambda (x) (f (g x))))
(define (square x) (* x x))
(define (repeated f times)
  (cond ((= times 1 ) f)
        (else (compose f (repeated f (- times 1))))))