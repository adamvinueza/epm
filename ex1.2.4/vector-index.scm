(define (vector-index-acc pred v acc)
  (if (null? v)
      #f
      (if (pred (car v))
          acc
          (vector-index-acc pred (cdr v) (+ 1 acc)))))

(define (vector-index pred v)
  (vector-index-acc pred v 0))
