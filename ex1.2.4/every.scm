(define (every? pred lst)
  (if (null? lst)
      #t
      (and (pred (car lst)) (every? pred (cdr lst)))))
