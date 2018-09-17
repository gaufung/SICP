(define tolerance 0.0001)
(define (fix-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define golden-ratio (fix-point (lambda (x)(+ 1 (/ 1 x))) 0.5))
