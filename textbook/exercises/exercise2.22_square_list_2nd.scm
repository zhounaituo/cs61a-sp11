; Exercise 2.22. Louis Reasoner tries to rewrite the first 
; square-list procedure of exercise 2.21 so that it evolves an 
; iterative process:

(define (square-list items) 
    (define (iter things answer) 
        (if (null? things) 
            answer 
            (iter (cdr things) 
                  (cons (square (car things)) 
                        answer)))) 
    (iter items nil))


; Unfortunately, defining square-list this way produces the 
; answer list in the reverse order of the one desired. Why?

; Answer: Because in the part of `(iter (cdr things) (cons...))`
; , the order has been reversed.

; Louis then tries to fix his bug by interchanging the arguments 
; to cons:

(define (square-list items) 
    (define (iter things answer) 
        (if (null? things) 
            answer 
            (iter (cdr things) 
                  (cons answer 
                        (square (car things)))))) 
    (iter items nil))

; This doesn't work either. Explain.

; Explain: We can try using (cons nil 1) and find that the 
; result is (() 1). This is the reason for the problem. The cons 
; function cannot ideally combine the parameters in the order of 
; list and item.