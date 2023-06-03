(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s)))

(define (caddr s)
  (car (cddr s)))


(define (sign num)
  (cond((> 0 num) -1)((< 0 num) 1)(else 0))
)


(define (square x) (* x x))

; how to use square?
(define (pow x y)
  (cond((= 1 x) 1)((= 0 y) 1)((= 1 y) x)((= 0 (modulo y 2))(* (pow x (quotient y 2)) (pow x (quotient y 2))))(else (* x (* (pow x (quotient (- y 1) 2)) (pow x (quotient (- y 1) 2))))))
)

;(define (pow x y)
;  (cond((= 0 y) 1)((= 1 y) x)(else (* x (* (pow x (quotient (- y 1) 2)) (pow x (quotient (- y 1) 2))))))
;)