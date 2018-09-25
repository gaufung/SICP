(define (adjoin-set x set)
  (define (adjoin-iter-set previous-set x forward-set)
    (if (null? forward-set)
	(append previous-set (list x))
	(let ((pivot (car forward-set)))
	  (cond ((= x pivot) (append previous-set forward-set))
		((> x pivot) (adjoin-iter-set (append previous-set (list pivot)) x (cdr forward-set)))
		(else
		 (append (append previous-set (list x)) forward-set))))))
  (adjoin-iter-set '() x set))
 
