(define factorials
  (cons-stream 1 (mul-stream integers factorials)))
