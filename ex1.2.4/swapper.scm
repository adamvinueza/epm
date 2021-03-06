(define (swapper s1 s2 slist)
  (if (null? slist)
    '()
    (let (
      (h (car slist))
      (t (cdr slist)))
      (if (eq? s1 h)
          (cons s2 (swapper s1 s2 t))
          (if (eq? s2 h)
              (cons s1 (swapper s1 s2 t))
              (cons h (swapper s1 s2 t)))))))
