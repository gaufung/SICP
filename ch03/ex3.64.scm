(define (stream-limit s tolerance)
  (let ((s1 (stream-ref s 1))
	(s2 (stream-ref s 0)))
    (if (< (abs (- s1 s2)) tolerance)
	s2
	(stream-limit (stream-cdr s) tolerance))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

