(define (exists? pred lst)
  (if (null? lst)
      #f
      (or (pred (car lst)) (exists? pred (cdr lst)))))
