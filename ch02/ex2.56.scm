;; (variable? e): Is e a variable
;; (same-variable? v1 v2): Are v1 and v2 the same variable?
;; (sum? e): Is e a sum?
;; (addend e): Addend of the sum e;
;; (aguend e): gugend of the sum e
;; (make-sum a1 a2): Construct the sum of a1 and a2
;; (product? e): Is e a product?
;; (multiplier e): Multipier of the product e
;; (multiplicand e): multiplicand of product e
;; (make-product m1 m2):Construct the product of m1 and m2

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	((sum? exp)(make-sum (deriv (addend exp) var)
			     (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product (multiplier exp)
			(deriv (multiplicand exp) var))
	  (make-product (deriv (multiplier exp) var)
			(multiplicand exp))))
	((exponentiation? exp)
	 (make-product (make-product (exponent exp)
				     (if (variable? (exponent exp))
					 (make-exponentiation (base exp) (list '- (exponent exp) '1))
					 (let ((new-exponent (- (exponent exp) 1)))
					   (cond ((= new-exponent 0) 1)
						 ((= new-exponent 1) (base exp))
						 (else (make-exponentiation (base exp) new-exponent))))))
		       (deriv (base exp) var)))
	(else
	 (error "unknonw expression type: DERIV" exp))))

(define (variable? x)
  (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)(variable? v2) (eq? v1 v2)))


(define (make-sum a1 a2)(list '+ a1 a2))
(define (make-product m1 m2)(list '* m1 m2))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s)(cadr s))
(define (augend s) (caddr s))
(define (product? x)(and (pair? x)(eq? (car x) '*)))
(define (multiplier p)(cadr p))
(define (multiplicand p)(caddr p))
(define (exponentiation? p)(and (pair? p)(eq? (car p) '**)))
(define (base p)(cadr p))
(define (exponent p)(caddr p))
(define (make-exponentiation b e)(list '** b e))
