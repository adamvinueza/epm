#|
Return a list of lefts and rights showing how to find the node containing n.
|#
(define (path n bst)
  (if (null? bst)
    '() ; we're done
    (if (< n (car bst))
      (cons 'left (path n (cadr bst))) ; go left (cadr = left subtree)
      (if (> n (car bst))
          (cons 'right (path n (caddr bst))) ; go right (caddr = right subtree)
          '()))))
