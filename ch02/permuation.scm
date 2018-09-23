(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (filter predict seq)
  (cond ((null? seq) '())
	((predict (car seq))
	 (cons (car seq)
	       (filter predict (cdr seq))))
	(else (filter predict (cdr seq)))))

(define (remove item seq)
  (filter (lambda (x) (not (= x item))) seq))

(define (permutation s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
		 (map (lambda (p) (cons x p))
		      (permutation (remove x s))))
	       s)))
