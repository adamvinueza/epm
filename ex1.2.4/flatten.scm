(define (flatten lst)
  ; return a list of all non-list elements, in order of occurrence
  (if (null? lst)
      '()
      (if (list? lst)
        (let ((h (car lst)) (t (cdr lst)))
          (if (list? h)
              ; flatten both car and cdr, join result
              (append (flatten h) (flatten t))
              ; put car in front of flattened cdr
              (cons h (flatten t))))
          ; not a list, return the element
          lst)))
