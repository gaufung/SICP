(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.0001)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x)((deriv g) x)))))

(define (fix-point f guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       dx))
  (define (try-guess guess)
    (define next (f guess)
      (if (close-enough? next guess)
	  next
	  (try-guess next))))
  (try-guess guess))

(define (new-method g guess)
  (fix-point (new-trainsform g) guess))

(define (square x)(* x x))

(define (sqrt x)
  (newtons-method
   (lambda (y) (- (square y) x)) 1.0))
