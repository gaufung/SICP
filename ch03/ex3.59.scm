(define (integrate-series stream)
  (stream-map * (stream-map / ones integers) stream))

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))


(define sine-series (cons-stream 0 (integrate-series cosine-series)))

(define cosine-series
  (cons-stream 1
	       (integrate-series (scale-stream sine-series -1))))
