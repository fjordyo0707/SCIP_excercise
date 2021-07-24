#lang sicp
(define dx 0.00001)
(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f times)
  (cond ((= times 1 ) f)
        (else (compose f (repeated f (- times 1))))))
(define (smooth f)
  (define (avg3 x1 x2 x3) (/ (+ x1 x2 x3) 3) )
  (lambda (x) (avg3 (f x) (f (- x dx)) (f (+ x dx)))))
(define cmd (((repeated smooth 5) square) 5))