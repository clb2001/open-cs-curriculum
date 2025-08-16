(define (filter-lst fn lst)
  (cond ((null? lst) '())
        ((fn (car lst))
         (cons (car lst)
               (filter-lst fn (cdr lst))))
        (else (filter-lst fn (cdr lst))))
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)

;cons 过程接受两个参数，第一个参数是要插入到列表中的元素，第二个参数是列表本身。它返回一个新的列表，该列表以第一个参数作为头部，第二个参数作为尾部。
;在Scheme中，member是一个内置过程，用于检查一个元素是否在列表中，并返回第一次出现该元素的子列表。
;(define (interleave first second)
;  (cond ((null? first) second)
;        ((member (car first) second)
;         (interleave (cdr first) second))
;        (else
;         (cons (car first) 
;               (interleave (cdr first) second))))
;)

(define (interleave first second)
  (cond ((null? first) second)
       ((null? second) first)
       (else (cons (car first)
                   (cons (car second)
                         (interleave (cdr first) (cdr second))))))
)

(interleave (list 1 3 5) (list 2 4 6))
; expect (1 2 3 4 5 6)

(interleave (list 1 3 5) nil)
; expect (1 3 5)

(interleave (list 1 3 5) (list 2 4))
; expect (1 2 3 4 5)


(define (accumulate combiner start n term)
  (cond ((= 0 (term n)) start)
        (else (combiner (term n) (accumulate combiner start (- n 1) term))))
)


(define (element-in-list? element lst)
  (cond ((null? lst) #f)
       ((eq? element (car lst)) #t)
       (else (element-in-list? element (cdr lst))))
)

(define (no-repeats lst)
  (define (helper input result)
    (cond ((null? input) result)
          ((element-in-list? (car input) result)
           (helper (cdr input) result))
          (else (helper (cdr input) (append result (list (car input)))))))
  (helper lst '())
)

