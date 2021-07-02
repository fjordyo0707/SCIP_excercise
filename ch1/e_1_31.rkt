#lang sicp
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result  (term a)))))
  (iter a 1))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (inc n) (+ n 1))
(define (identity x) x)
(define (cube x) (* x x x))

(define (inc-2 n) (+ n 2))

(define (sub-pi-term n)
  (define (square n) (* n n))
  (/ (* (- n 1) (+ n 1)) (square n)) )

(define (factorial-recur n)
  (product identity 1 inc n))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

(define (pi n)
  (exact->inexact(* 4 (product-iter sub-pi-term 3 inc-2 n))))