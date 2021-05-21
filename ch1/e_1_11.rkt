#lang sicp
(define (f n)
  (if (< n 3)
       n
       ( + (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))

(define (Fi n)
  (define (f-iter count n a b c)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          ((= n 2) 2)
          ((> count n) a)
          (else (f-iter (+ count 1) n (+ a (* 2 b) (* 3 c)) a b))
          ))
  (f-iter 3 n 2 1 0)
  )