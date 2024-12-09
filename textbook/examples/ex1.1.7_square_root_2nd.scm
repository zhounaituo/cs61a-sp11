; (sqrt 57083798175987139744130975)
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- guess (/ x guess))) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))