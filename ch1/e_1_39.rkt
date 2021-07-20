#lang sicp
(define (cont-frac-recur n d k)
  (define (frac i)
    (/ (n i) (- (d i)
                (if (= i k)
                    0
                    (frac (+ i 1))))) )
  (frac 1))

(define (tan-cf x k)
  (define (DI i)
    (- (* i 2) 1))
  (define (NI i)
    (cond ((= i 1) x)
          (else (* x x))))
  (cont-frac-recur NI DI k) )