#lang sicp
(define (iterative-improve good-enough improve-guess)
  (lambda (x) (let ((next-guess (improve-guess x)))
                (if (good-enough x next-guess)
                  x
                  ((iterative-improve good-enough improve-guess) next-guess)))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve close-enough? improve) first-guess))

(define (average-damp f)
  (define (average x1 x2) (/ (+ x1 x2) 2))
  (lambda (x) (average x (f x))))
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))
(define cmd1 (sqrt 64))

