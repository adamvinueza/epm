(define (up lst)
  ; removes a pair of parentheses from each top-level element
  ; > (up '((1 2) (3 4))) => (1 2 3 4)
  (if (null? lst)
      '()
      (if (list? (car lst))
          (append (car lst) (up (cdr lst)))
          (cons (car lst) (up (cdr lst))))))
