
(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define (filer predict seq)
  (cond ((null? seq) '())
	((predict (car seq))
	 (cons (car seq)
	       (filter predict (cdr seq))))
	(else (filter predict (cdr seq)))))
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (order-triple n)
  (accumulate append '()
	      (map (lambda (i)
		     (map (lambda (j)
			    (map (lambda (k) (list i j k))
				 (enumerate-interval 1 (- j 1))))
			  (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n))))



(define (triple-sum n s)
  (define (triple-sum-equal? pair)
    (= (+ (car pair)
	  (cadr pair)
	  (caddr pair))
       s))
  (filter triple-sum-equal? (order-triple n)))
