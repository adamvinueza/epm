#|
Functions for building and manipulating binary search trees.
So far, there are only construction and traversal methods.
|#
(define (bst-make n left right)
  (list n left right))

(define (bst-make-empty)
  '())

(define (bst-isempty? bst)
  (null? bst))

(define (bst-value bst)
  (if (bst-isempty? bst)
    bst
    (car bst)))

(define (bst-left bst)
  (if (bst-isempty? bst)
    bst
    (cadr bst)))

(define (bst-right bst)
  (if (bst-isempty? bst)
    bst
    (caddr bst)))

(define (bst-add bst n)
  (if (bst-isempty? bst)
    (bst-make n (bst-make-empty) (bst-make-empty))
    (if (< n (bst-value bst))
        (bst-make (bst-value bst)
          (bst-add (bst-left bst) n)
          (bst-right bst))
        (if (> n (bst-value bst))
          (bst-make (bst-value bst)
            (bst-left bst)
            (bst-add (bst-right bst) n))
          bst))))

(define (bst-add-list bst lst)
  (if (bst-isempty? lst)
    bst
    (bst-add-list (bst-add bst (car lst)) (cdr lst))))

(define (bst-traverse-inorder bst)
  (if (bst-isempty? bst)
    bst
    (append (bst-traverse-inorder (bst-left bst))
            (list (bst-value bst))
            (bst-traverse-inorder (bst-right bst)))))

(define (bst-traverse-preorder bst)
  (if (bst-isempty? bst)
    bst
    (append 
            (list (bst-value bst))
            (bst-traverse-preorder (bst-left bst))
            (bst-traverse-preorder (bst-right bst)))))

(define (bst-traverse-postorder bst)
  (if (bst-isempty? bst)
    bst
    (append 
            (bst-traverse-postorder (bst-left bst))
            (bst-traverse-postorder (bst-right bst))
            (list (bst-value bst)))))
