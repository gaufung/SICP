(define (exp-summands n)
  (cons-stream (/ 1.0 n)
	       (stream-map - (exp-summands (+ n 1)))))

(define ln2-stream
  (partial-sum (exp-summands 1)))


