(define (down lst)
  (if (null? lst)
      '()
      (cons (list (car lst)) (down (cdr lst)))))
