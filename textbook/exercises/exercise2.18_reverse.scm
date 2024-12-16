; Exercise 2.18. Define a procedure reverse that takes a list 
; as argument and returns a list of the same elements in 
; reverse order:

(define a (list 1 4 9 16 25))

(define (reverse list)
    (if (null? list)
        nil
        (cons (reverse (cdr list)) (car list))))