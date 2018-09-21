(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define (fold-right op init seq)
  (accumulate op init seq))

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter init seq))

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (append (list y) x)) '() sequence))
