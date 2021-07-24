#lang sicp
(define (inc x) (+ x 1))
(define (double func) (lambda (x) (func (func x))))