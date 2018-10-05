(define (partial-sum stream)
  (cons-stream (stream-car stream)
	       (add-streams (stream-cdr stream)
			   (partial-sum stream))))

