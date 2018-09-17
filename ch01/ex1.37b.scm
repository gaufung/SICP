(define (cont-frac fn fd k)
  (define (cont-frac-rec fn fd i)
    (if (= i k)
	(/ (fn i)(fd i))
	(/ (fn i)(+ (fd i)(cont-frac-rec fn fd (+ i 1))))))
  (cont-frac-rec fn fd 1))

(define golden-ratio (cont-frac (lambda (x) (1.0)) (lambda (x) (1.0)) 100))
