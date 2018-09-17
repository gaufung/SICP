(define (cont-frac fn fd k)
  (define (cont-frac-iter fn fd k result)
    (if (= k 0)
        result
        (cont-frac-iter fn fd (- k 1) (/ (fn (- k 1)) (+ (fd (- k 1)) result)))))
  (cont-frac-iter fn fd k 0.0))
(define golden-ratio (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 100))
