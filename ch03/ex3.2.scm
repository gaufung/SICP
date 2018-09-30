(define (make-monitor proc)
  (let ((call-times 0))
    (define (dispatch arg)
      (if (eq? arg 'how-many-calls?)
	  call-times
	  (begin (set! call-times (+ 1 call-times))
		 (proc arg))))
    dispatch))
