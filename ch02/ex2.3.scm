(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-point c1 c2)
  (cons c1 c2))

(define (make-rect p1 p2)
  (cons p1 p2))

(define (left-bottom r)
  (car r))

(define (right-top r)
  (cdr r))

(define (height r)
  (- (y-point (right-top r))
     (y-point (left-bottom r))))

(define (width r)
  (- (x-point (right-top r))
     (x-point (left-bottom r))))

(define (perimeter r)
  (* (+ (height r) (width r)) 2))

(define (area r)
  (* (height r) (width r)))
