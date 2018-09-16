(define (filtered-accumulate filter combiner null-value term a next b)
  (define (predict x)
    (if (filter x)
	x
	null-value
	)
    )
  (if (> a b)
      null-value
      (combiner (predict (term a))
		(filtered-accumulate filter combiner null-value term (next a) next b)
		)
      )
  )

(define (add a b)(+ a b))
(define (identify x) x)
(define (inc x)(+ x 1))
