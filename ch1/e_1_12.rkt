#lang sicp

(define (pascal_element row col)
  (cond ((= row 1) 1)
        ((= col 1) 1)
        ((= col row) 1)
        (else (+ (pascal_element (- row 1) (- col 1))
                 (pascal_element (- row 1) col)))))