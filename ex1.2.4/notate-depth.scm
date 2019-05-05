(define (notate-depth lst)
  (notate-depth-in-slist lst 0))

(define (notate-depth-in-slist lst d)
  (if (null? lst)
    '()
    (cons
      (notate-depth-in-symbol-expression (car lst) d)
      (notate-depth-in-slist (cdr lst) d))))

(define (notate-depth-in-symbol-expression se d)
  (if (symbol? se)
    (list se d)
    (notate-depth-in-slist se (+ d 1))))
