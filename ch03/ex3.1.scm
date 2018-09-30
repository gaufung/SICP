(define (make-accumulator init)
  (lambda (amount)
    (begin (set! init (+ init amount))
	   init)))
