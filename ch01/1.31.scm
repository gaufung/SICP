(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))))

(define (pi-term x)
    (/ (* (- x 1) (+ x 1) 1.0) (* x x)))

(define (pi-next n) (+ n 2))

(define (product-pi n)
    (* 4 (product pi-term 3 pi-next (+ (* 2 n) 1))))
