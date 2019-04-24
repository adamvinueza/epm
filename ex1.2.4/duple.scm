(define (duple n m)
    (if (= n 0)
        '()
        (cons m (duple (- n 1) m))))
