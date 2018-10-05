(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x)(f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (add-1 one))


