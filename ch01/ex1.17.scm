(define (mul a b)
  (if (= b 0)
      0
      (+ a
	 (mul a (- b 1)))))

(define (even? n)
  (= (remainder n 2) 0))
(define (double n)
  (+ n n))
(define (fast-mul a b)
  (cond ((= b 0) 0)
	((= b 1) a)
	((even? b)(double (fast-mul a (/ b 2))))
	(else (+ a (fast-mul a (- b 1))))))
