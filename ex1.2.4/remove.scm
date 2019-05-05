(define (remove s lst)
  (if (null? lst)
    lst
    (if (eq? s (car lst))
      (remove s (cdr lst))
      (cons (car lst) (remove s (cdr lst))))))
