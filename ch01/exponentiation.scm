(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (fast-expt b n)
  (define (even? x)
    (= (remainder 2) 0))
  (define (square x)
    (* x x))
  (cond ((= n 0) 1)
	((even? n)(square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

