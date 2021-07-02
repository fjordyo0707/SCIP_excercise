#lang sicp
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result  (term a)))))
  (iter a null-value))

(define (accumulate-recur combiner null-value term a next b)
(if (> a b)
    null-value
    (combiner (term a)
     (accumulate-recur combiner null-value term (next a) next b))))

(define (inc n) (+ n 1))
(define (identity x) x)
(define (my_add x y) (+ x y))
(define (my_product x y) (* x y))