; Makes a call to subst-in-symbol-expression, which calls this method, but only
; on (car lst).
(define (subst new old lst)
  (if (null? lst)
    lst
    (cons
      (subst-in-symbol-expression new old (car lst))
      (subst new old (cdr lst)))))

; lines 13-15 are inline-substitution of the body of subst-in-symbol-expression
(define (subst-inline new old lst)
  (if (null? lst)
    lst
    (cons
      (if (symbol? (car lst))
        (if (eqv? old (car lst)) new (car lst))
        (subst-inline new old (car lst)))
      (subst-inline new old (cdr lst)))))

; Mutually recursive call to subst. The recursive call will always halt because
; subst-in-symbol-expression is only called on (car lst).
(define (subst-in-symbol-expression new old se)
  (if (symbol? se)
    (if (eqv? old se) new se)
    (subst new old se)))

; Uses map to iterate over list items instead of a recursive call. Makes a
; recursive call only to dive into elements that are lists.
(define (subst-map new old lst)
  (map
    (lambda (elem)
      (if (symbol? elem)
        (if (eqv? old elem) new elem)
        (subst-map new old elem))) lst))
