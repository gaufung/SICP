(define (make-rat n d)
  (cond ((and (< n 0)(< d 0))(make-rat (- n)(- d)))
	((and (> n 0)(< d 0))(make-rat (- n)(- d)))
	(else
	 (let ((g (gcd n d)))
	   (cons (/ n g)(/ d g))))))
