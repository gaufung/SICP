(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left-branch right-branch)
  (list entry left-branch right-branch))

(define (list-tree elements)
  (car (partial-tree elements (length elements))))

(define (parial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-sieze (quotient (- n 1) 2)))
	(let ((left-result (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result
		   (partial-tree (cdr non-left-elts) right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts (cdr right-result)))
		(cons (make-tree this-entry
				 left-tree
				 right-tree)
		      remianing-elts))))))))
