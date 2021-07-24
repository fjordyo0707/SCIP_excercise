#lang sicp
(define (average-damp f)
  (define (average x1 x2) (/ (+ x1 x2) 2))
  (lambda (x) (average x (f x))))
(define (square x) (* x x))
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f times)
  (cond ((= times 1 ) f)
        (else (compose f (repeated f (- times 1))))))

(define (n-root x n damp-times)
  (fixed-point ((repeated average-damp damp-times) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))
; Through my experiment, I notice n-root converge when n < 2^(damp-times+1)
(define cmd0 (n-root 100 31 4))
;(define cmd1 (n-root 100 32 4)) <- this will not converge
(define cmd2 (n-root 100 32 5))

