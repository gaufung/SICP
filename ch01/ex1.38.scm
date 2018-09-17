(define (fn i) 1)
(define (fd i)
  (cond ((= i 1) 1)
	((= i 2) 2)
	 ((or (= (remainder (- i 2) 3) 1) (= (remainder (- i 2) 3) 2)) 1)
         ((+ (* (/ 2.0 3)(- i 2)) 2))))

(define (cont-frac fn fd k)
  (define (cont-frac-iter fn fd k result)
    (if (= k 0)
        result
        (cont-frac-iter fn fd (- k 1) (/ (fn (- k 1)) (+ (fd (- k 1)) result)))))
  (cont-frac-iter fn fd k 0.0))

(define (natural n)
  (+ (cont-frac fn fd n) 2))
