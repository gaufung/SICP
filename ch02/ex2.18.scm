(define (reverse items)
  (define (reverse-rec items rev-items)
    (if (null? items)
	rev-items
	(reverse-rec (cdr items)(cons (car items) rev-items))))
  (reverse-rec items (list)))
