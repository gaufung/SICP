(define (fib-recursive n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib-recursive (- n 1))
		 (fib-recursive (- n 2))))))

(define (fib-iterative n)
  (define (fib-iter a b count)
    (if (= count 0)
	b
	(fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))
