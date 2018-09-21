(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (car seqs))
	    (accumulate-n op init (cdr seqs)))))
