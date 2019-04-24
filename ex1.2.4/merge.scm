(define (merge-to nums n)
  (if (null? nums)
      (list n)
      (if (< n (car nums))
          (cons n nums)
          (cons (car nums) (merge-to (cdr nums) n)))))

(define (merge lon1 lon2)
  ; return sorted list of numbers from ascending lon1 and lon2
  ; (merge '(1 3 8) '(2 7)) => (1 2 7 8)
  (if (null? lon1)
    lon2
    (if (null? lon2)
      lon1
      (let ((h1 (car lon1)) (h2 (car lon2)))
        (if (< h1 h2)
            (cons h1 (merge (cdr lon1) lon2))
            (cons h2 (merge lon1 (cdr lon2))))))))
