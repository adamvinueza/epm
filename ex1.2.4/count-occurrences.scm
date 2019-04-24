(define (count-occurrences x lst)
  (if (null? lst)
    0
    (if (eq? x lst)
      1
      (let ((h (car lst)) (t (cdr lst))) ; don't re-compute car and cdr
        (if (list? h) ; we have two lists, sum the function calls
          (+ (count-occurrences x h) (count-occurrences x t))
          (if (eq? x h) ; one list, either 1 + call or just the call
            (+ 1 (count-occurrences x t))
            (count-occurrences x t)))))))
