#lang sicp
(define (cont-frac-recur n d k)
  (define (frac i)
    (/ (n i) (+ (d i)
                (if (= i k)
                    0
                    (frac (+ i 1))))) )
  (frac 1))

(define (cont-frac-iter n d k)
  (define (frac-iter i result)
    (if (= i k)
        result
        (frac-iter (+ 1 i) (/ (n i) (+ (d i) result)))
     ))
  (frac-iter 1 1))