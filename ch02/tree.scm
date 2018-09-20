(define (length tree)
  (if (null? tree)
      0
      (+ 1 (length (cdr tree)))))

(define (count-leave tree)
  (cond ((null? tree) 0)
	((not (pair? tree)) 1)
	(else (+ (count-leave (car x))
		 (count-leave (cdr x))))0))

