(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (cdr m))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (cdr b))

(define (total-weight m)
  (cond ((null? m) 0)
	((not (pair? m)) m)
	(else
	 (+ (total-weight (left-branch m))
	    (total-weight (right-branch m))))))
