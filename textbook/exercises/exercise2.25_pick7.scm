; Exercise 2.25: Give combinations of cars and cdrs that
; will pick 7 from each of the following lists:

; (1 3 (5 7) 9)
(cdr (car (cdr (cdr x))))

; ((7))
(car (car x))

; (1 (2 (3 (4 (5 (6 7))))))
(cadr (cadr (cadr (cadr (cadr (cadr x))))))
