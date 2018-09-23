(define (unique-pairs n)
  (accumulate cons
	      '()
	      (map (lambda (i)
		     (map (lambda (j) (cons i j))
			  (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n))))
