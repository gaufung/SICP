(define (pascal-triangle x y)
    (cond ((= y 1) 1)
        ((= y x) 1)
        (else (+ (pascal-triangle (- x 1) (- y 1)) (pascal-triangle (- x 1) (+ y 0))))))