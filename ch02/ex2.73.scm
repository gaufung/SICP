(define table (list))
(define (put op type proc)
  (set! table (append table (list (list op type proc)))))
(define (get op type)
  (define (search op type t)
    (cond ((null? t) #f)
	  ((and (equal? (caar t) op)(equal? (cadar t) type))
	   (caddar t))
	  (else (search op type (cdr t)))))
  (search op type table))

(define (install-deriv)
  (define (variable? exp)
    (symbol? exp))
  (define (same-variable? v1 v2)
    (and (variable? v1)(variable? v2)(equal? v1 v2)))
  (define (addend exp)(car exp))
  (define (augend exp)(cadr exp))
  (define (make-sum exp1 exp2)
    (list '+ exp1 exp2))
  (define (multiplier exp)(car exp))
  (define (multiplicand exp)(cadr exp))
  (define (make-product exp1 exp2)
    (list '* exp1 exp2))
  (put 'deriv '+
       (lambda (exp var)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var))))
  (put 'deriv '*
       (lambda (exp var)
	 (make-sum (make-product
		    (multiplier exp)
		    (deriv (multiplicand exp) var))
		   (make-product
		    (deriv (multiplier exp) var)
		    (multiplicand exp)))))
  'done)
  

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)(if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp))
	       (operands exp) var))))
(define (operator exp)(car exp))
(define (operands exp)(cdr exp))

