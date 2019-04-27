; the sorting algorithm depends on the merge functions here
(load "merge.scm")

; get the first item in lst
(define (first lst)
  (car lst))

; get the second item lst
(define (second lst)
  (car (cdr lst)))

; get the length of lst
(define (length lst)
  (if (null? lst)
    0
    (+ 1 (length (cdr lst)))))

; get the items starting from index n in lst
(define (tail-from n lst)
  (if (or (null? lst) (= n 0))
    lst
    (tail-from (- n 1) (cdr lst))))

; take the first n items in lst
(define (take n lst)
  (if (or (= n 0) (null? lst))
    '()
    (cons (car lst) (take (- n 1) (cdr lst)))))

; split lst at idx
(define (split idx lst)
  (cons (take idx lst) (list (tail-from idx lst))))

; sort lst in order by pred
(define (sort-pred pred lst)
  (if (< (length lst) 2)
    lst
    (let ((half (split (floor (/ (length lst) 2)) lst)))
      (merge-pred pred (sort-pred pred (first half)) (sort-pred pred (second half))))))

; sort lst ascending
(define (sort lst)
  (sort-pred < lst))
