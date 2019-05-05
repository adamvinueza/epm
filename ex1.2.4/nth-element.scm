(define (nth-element lst n)
  (let ((fail-msg 
    (format #f "List ~s does not contain ~s elements" lst n)))
    (nth-element-msg lst n fail-msg)))

(define (nth-element-msg lst n error-msg)
  (if (null? lst)
    (error 'nth-element error-msg)
    (if (= n 0)
      (car lst)
      (nth-element-msg (cdr lst) (- n 1) error-msg))))

(define (nth-elt lst n)
  (letrec (
    [fail-msg (format #f "List ~s does not contain ~s elements" lst n)]
    [ne (lambda (l k error-msg)
      (if (null? l)
        (error 'nth-elt error-msg)
        (if (= k 0)
          (car l)
          (ne (cdr l) (- k 1) error-msg))))])
      (ne lst n fail-msg)))

