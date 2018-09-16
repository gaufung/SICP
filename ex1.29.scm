(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b)
	 )
      )
  )

(define (round-to-next-even x)
  (+ x
     (remainder x 2)
     )
  )

(define (inc x)
  (+ x 1)
  )

(define (simpon f a b n)
  (let ((fixed-n (round-to-next-even n)))
    (let ((h (/ (- b a) fixed-n)))
      (define (simpson-term k)
	(let ((y (f (+ a (* k h)))))
	  (if (or (= k 0) (= k fixed-n))
	      y
	      (if (even? k)
		  (* 2 y)
		  (* 4 y)))))
      (* (/ h 3)(sum simpson-term 0 inc fixed-n)))))

