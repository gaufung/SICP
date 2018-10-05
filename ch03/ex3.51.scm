(define (display-line x)
  (newline)
  (display x))

(define (show x)
  (display x)
  x)

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))


(define x
  (stream-map show
	      (stream-enumerate-interval 0 10)))
