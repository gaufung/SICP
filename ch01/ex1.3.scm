(define (square x)
  (* x x))
(define (sum-of-square a b)
  (+ (square a) (square b)))
(define (sum-of-two-large-square a b c)
  (cond ((and (>= a c)(>= b c))(sum-of-square a b))
	((and (>= b a)(>= c a))(sum-of-square b c))
	((and (>= a b)(>= c a))(sum-of-square a c))))
