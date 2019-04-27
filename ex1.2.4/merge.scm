(define (merge-to nums n)
  (if (null? nums)
      (list n)
      (if (< n (car nums))
          (cons n nums)
          (cons (car nums) (merge-to (cdr nums) n)))))

(define (merge-pred pred lon1 lon2)
  (if (null? lon1)
    lon2
    (if (null? lon2)
      lon1
      (let ((h1 (car lon1)) (h2 (car lon2)))
        (if (pred h1 h2)
            (cons h1 (merge-pred pred (cdr lon1) lon2))
            (cons h2 (merge-pred pred lon1 (cdr lon2))))))))

(define (merge lon1 lon2)
  (merge-pred < lon1 lon2))
