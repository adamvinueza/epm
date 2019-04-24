(define (map-to lst obj)
      (if (null? lst)
          '()
          (cons (list (car lst) obj) (map-to (cdr lst) obj))))

(define (product los1 los2)
  (if (null? los2)
      '()
      (append (map-to los1 (car los2)) (product los1 (cdr los2)))))
