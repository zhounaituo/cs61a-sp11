;;;;;
(define (cons x y)
    (lambda (which)
        (cond ((equal? which 'car) x)
              ((equal? which 'cdr) y)
              (else (error "Bad message to CONS" message)) )))