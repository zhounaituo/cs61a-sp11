; Linear recursion and iteration

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))) )

;;;;;
; a linear iterative process for factorial.
(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product 
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))


