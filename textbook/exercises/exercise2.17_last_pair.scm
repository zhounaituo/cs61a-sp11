; Exercise 2.17. Define a procedure last-pair that returns the 
; list that contains only the last element of a given 
; (nonempty) list:

; (last-pair (list 23 72 149 34)) ; (34)

(define a (list 23 72 149 34))

(define (last-pair list)
    (cond ((null? list) (error "List is empty."))
          ((null? (cdr list)) (car list))
          (else (last-pair (cdr list))) ))