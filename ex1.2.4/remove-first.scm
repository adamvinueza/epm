; Remove the first occurrence of s from lst
(define (remove-first s lst)
  (if (null? lst)
    lst
    (if (eq? s (car lst))
      (cdr lst)
      (cons (car lst) (remove-first s (cdr lst))))))
