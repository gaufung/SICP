(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (nest-map n)
  (accumulate append
	      '()
	      (map (lambda (i)
		     (map (lambda (j)(list (i j))
				  (enumerate-interval 1 (- i 1)))))
		   (enumerate-interval 1 n))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))


(define (odd-sum? pair)
  (odd? (+ (car pair) (cadr pair))))


(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (filter predicate seq)
  (cond ((null? seq) '())
	((predicate (car seq))
	 (cons (car seq)
	       (filter predicate (cdr seq))))
	(else (filter predicate (cdr seq)))))

(define (odd-sum-pairs n)
  (map make-pair-sum
       (filter odd-sum? (flatmap
			   (lambda (i)
			     (map (lambda (j) (list i j))
				  (enumerate-interval 1 (- i 1))))
	       (enumerate-interval 1 (- n 1))))))
