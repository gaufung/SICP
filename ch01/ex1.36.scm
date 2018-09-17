(define tolerance 0.0001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2))
     tolerance))

(define (fix-point f first-guess)
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(fix-point (lambda (x)(/ (log 1000)(log x))) 3)
