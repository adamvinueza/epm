(define (partial-vector-sum von n)
  (let ((idx (- n 1)))
    (if (zero? n)
      0
      (+ (vector-ref von idx)
         (partial-vector-sum von idx)))))

(define (vector-sum von)
  (partial-vector-sum von (vector-length von)))

(define (vector-sum2 von)
  (letrec
    ((partial-sum 
      (lambda (n)
        (if (zero? n)
          0
          (+ (vector-ref von (- n 1))
             (partial-sum (- n 1)))))))
    (partial-sum (vector-length von))))
