(define (tan-cf x k)
  (define (tan-fc-iter x i result)
    (if (= i 1)
        (/ x (- 1 result))
        (tan-fc-iter x (- i 1) (/ (* x x)(- (* i 2) 1)))))
  (tan-fc-iter x k 0.0))

