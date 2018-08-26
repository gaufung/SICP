(define (function-recursive n)
    (cond ((< n 3) n)
    (else (+ (function (- n 1)) (* 2 (function (- n 2))) (* 3 (function (- n 3)))))))

(define (function-iterative n)
    (function-iter 0 1 2 n))

(define (function-iter a b c count)
    (cond ((= count 0) a)
        ((= count 1) b)
        ((= count 2) c)
        (else (function-iter b c (+ (* 3 a) (* 2 b) (* 1 c)) (- count 1)))))

