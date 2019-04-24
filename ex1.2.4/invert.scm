(define (reverse lst)
  (if (null? lst)
      '()
      (append
        (reverse (cdr lst))
        (list (car lst)))))

(define (reverse-two lst)
  (cons (car (cdr lst)) (list (car lst))))

(define (invert lst)
  (if (null? lst)
      '()
      (cons (reverse (car lst)) (invert (cdr lst)))))

(define (invert-two lst)
  (if (null? lst)
      '()
      (cons (reverse-two (car lst)) (invert-two (cdr lst)))))
