(define (vector-index-acc pred v acc)
  (if (null? v)
      #f
      (if (pred (car v))
          acc
          (vector-index-acc pred (cdr v) (+ 1 acc)))))

(define (vector-index-tail pred v)
  (vector-index-acc pred v 0))

(define (vector-index pred v)
  (if (null? v)
    #f
    (if (pred (car v))
      0
      (+ 1 (vector-index pred (cdr v))))))
