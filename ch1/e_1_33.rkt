#lang sicp
; The filter func here take one arg to achieve prime? of(b)
(define (accumulate-iter-filtered filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        (if (filter a)
            (term a)
            null-value)
        (iter (next a) (combiner result  (term a)))))
  (iter a null-value))

; The filter func here take two arg to achieve gcd? of(b)
(define (accumulate-recur-filtered filter combiner null-value term a next b)
(if (> a b)
    null-value
    (combiner
     (if (filter a b)
            (term a)
            null-value)
     (accumulate-recur-filtered filter combiner null-value term (next a) next b))))

(define (inc n) (+ n 1))
(define (identity x) x)
(define (my_add x y) (+ x y))
(define (my_product x y) (* x y))
(define (square a) (* a a))



(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (define (divides? a b)
      (= (remainder b a) 0))
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (= n (smallest-divisor n)))

(define (gcd? a b)
  (define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
  (if (= 1 (gcd a b))
      true
      false))