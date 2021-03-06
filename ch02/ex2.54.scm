(define (equal? a b)
  (cond ((and (symbol? a)(symbol? b)) (eq? a b))
	((and (null? a) (null? b)) #t)
	((and (not (pair? a)) (not (pair? b)))
	 (eq? a b))
	((and (pair? a)(pair? b))
	 (and (equal? (car a) (car b))
	      (equal? (cdr a) (cdr b))))
	(else #f)))
