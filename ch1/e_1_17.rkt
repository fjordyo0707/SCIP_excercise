#lang sicp
(define (mul a b)
  (cond ((= b 1) a) 
        ((even? b)(+ (mul a (/ b 2)) (mul a (/ b 2))))
        (else (+ a (mul a (- b 1))))))