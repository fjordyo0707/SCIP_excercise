#lang sicp
(define (cont-frac-recur n d k)
  (define (frac i)
    (/ (n i) (+ (d i)
                (if (= i k)
                    0
                    (frac (+ i 1))))) )
  (frac 1))

(define (Euler_Exp k)
  (define (DI i)
    (let ((di_temp (- i 2))
          (di_remainder (remainder (- i 2) 3))
          (di_mul (* 2 (+ 1 (/ (- i 2) 3)))))
    (cond ((= i 1) 1)
          ((= i 2) 2)
          ((= di_remainder 0) di_mul)
          (else 1))))
  (+ 2 (cont-frac-recur (lambda (x) 1) DI k)) )
