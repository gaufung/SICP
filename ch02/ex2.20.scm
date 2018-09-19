(define (same-parity x . z)
  (define (same x items result)
    (if (null? items)
	result
	(if (= (remainder x 2)(remainder (car items) 2))
	    (same x (cdr items) (append result (list (car items))))
	    (same x (cdr items) result))))
  (same x z (list x)))
