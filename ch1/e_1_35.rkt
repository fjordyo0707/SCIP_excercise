#lang sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          (exact->inexact next)
          (try next))))
  (try first-guess))

(define (golden-ratio x)
  (+ 1 (/ 1 x)))