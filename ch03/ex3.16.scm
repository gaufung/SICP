(define (count-pair x)
  (if (not (pair? x))
      0
      (+ (count-pair (car x))
	 (count-pair (cdr x))
	 1)))
