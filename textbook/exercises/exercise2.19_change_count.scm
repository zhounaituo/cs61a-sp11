; Exercise 2.19. Consider the change-counting program of 
; section 1.2.2. It would be nice to be able to easily change 
; the currency used by the program, so that we could compute 
; the number of ways to change a British pound, for example. 
; As the program is written, the knowledge of the currency is 
; distributed partly into the procedure first-denomination and 
; partly into the procedure count-change (which knows that 
; there are five kinds of U.S. coins). It would be nicer to be 
; able to supply a list of coins to be used for making change.

; 1.2.2
; (define (count-change amount)
;     (cc amount 5))
; (define (cc amount kinds-of-coins) 
;     (cond ((= amount 0) 1) 
;           ((or (< amount 0) (= kinds-of-coins 0)) 0) 
;           (else (+ (cc amount (- kinds-of-coins 1)) 
;                    (cc (- amount (first-denomination kinds-of-coins)) 
;                        kinds-of-coins))) ))
; (define (first-denomination kinds-of-coins) 
;     (cond ((= kinds-of-coins 1) 1) 
;           ((= kinds-of-coins 2) 5) 
;           ((= kinds-of-coins 3) 10) 
;           ((= kinds-of-coins 4) 25) 
;           ((= kinds-of-coins 5) 50)))

; We want to rewrite the procedure cc so that its second 
; argument is a list of the values of the coins to use rather 
; than an integer specifying which coins to use. We could then 
; have lists that defined each kind of currency:

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

; We could then call cc as follows:
; (cc 100 us-coins)
; 292

; To do this will require changing the program cc somewhat. It 
; will still have the same form, but it will access its second 
; argument differently, as follows:

(define (cc amount coin-values) 
    (cond ((= amount 0) 1) 
          ((or (< amount 0) (no-more? coin-values)) 0) 
          (else (+ (cc amount (except-first-denomination coin-values)) 
                   (cc (- amount (first-denomination coin-values)) 
                       coin-values))) ))

; Define the procedures first-denomination, 
; except-first-denomination, and no-more? in terms of 
; primitive operations on list structures. Does the order of 
; the list coin-values affect the answer produced by cc? Why 
; or why not?

(define (first-denomination coin-values)
    (list-ref coin-values 0))

(define (except-first-denomination coin-values)
    (cdr coin-values))

(define (no-more? ls) 
        (null? ls))

(define (list-ref ls num)
    (if (= num 0)
        (car ls)
        (list-ref (cdr ls) (- num 1))))