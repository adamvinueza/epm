(define (vector-append-list v lst)
  (vector-append-list-from-new 
    v lst (make-vector (+ (vector-length v) (length lst))) 0))

(define (vector-append-list-from-new v lst v-to-fill i)
  (if (< i (vector-length v))
    (let ((tmp (vector-set! v-to-fill i (vector-ref v i))))
      (vector-append-list-from-new v lst v-to-fill (+ i 1)))
    (if (null? lst)
      v-to-fill
      (let ((tmp (vector-set! v-to-fill i (car lst))))
        (vector-append-list-from-new v (cdr lst) v-to-fill (+ i 1))))))
      
    
