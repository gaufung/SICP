(define (fib n)
  (fib-iter 1 0 1 1 1 0 n))
(define (fib-iter a b c d e f count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (+ (* c c) (* d e))
		   (+ (* c d) (* d f))
		   (+ (* e c) (* f e))
		   (+ (* e d) (* f f))
		   (/ count 2)))
	(else (fib-iter (+ (* a c)(* b d))
			(+ (* a e)(* f b))
			c
			d
			e
			f
			(- count 1)))))
