(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* (term a) result))))
  (iter a 1))

(define (pi-term x)
  (/ (* (- x 1)(+ x 1) 1.0) (* x x)))

(define (pi-next n)
  (+ n 2))

(define (product-pi n)
  (* 4 (product pi-term 3 pi-next (+ (* 2 n) 1))))

(product-pi 100)
