(define (reverse items)
  (define (reverse-rec items rev-items)
    (if (null? items)
	rev-items
	(reverse-rec (cdr items)(cons (car items) rev-items))))
  (reverse-rec items (list)))

(define (deep-reverse items)
  (define (iter items acc)
    (if (null? items)
        acc
        (let ((head (car items))
              (tail (cdr items)))
          (if (list? head)
              (iter tail (append (list (deep-reverse head)) acc))
              (iter tail (append (list head) acc))))))
  (iter items '()))
