(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (define (add a b)(+ a b))
  (accumulate add 0 term a next b))

(define (prodcut term a next b)
  (define (multiply a b)(* a b))
  (accumulate multiply 1 term a next b))
