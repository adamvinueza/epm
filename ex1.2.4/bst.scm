; Functions for building and manipulating binary search trees.
; So far, there are only construction and traversal methods.
; There is no validation. 

; Build a bst from root value n and left/right subtrees
(define (bst-make n left right)
  (list n left right))

; Alias for checking empty list
(define (bst-isempty? bst)
  (null? bst))

; Get the value of the bst's root node
(define (bst-value bst)
  (if (bst-isempty? bst)
    bst
    (car bst)))

; Get the bst's left subtree
(define (bst-left bst)
  (if (bst-isempty? bst)
    bst
    (cadr bst)))

; Get the bst's  right subtree
(define (bst-right bst)
  (if (bst-isempty? bst)
    bst
    (caddr bst)))

; Add the value n to the bst
(define (bst-add bst n)
  (if (bst-isempty? bst)
    (bst-make n '() '())
    (if (< n (bst-value bst))
        (bst-make (bst-value bst)
          (bst-add (bst-left bst) n)
          (bst-right bst))
        (if (> n (bst-value bst))
          (bst-make (bst-value bst)
            (bst-left bst)
            (bst-add (bst-right bst) n))
          bst))))

; Add a list of values to the bst
(define (bst-add-list bst lst)
  (if (bst-isempty? lst)
    bst
    (bst-add-list (bst-add bst (car lst)) (cdr lst))))

; Traverse bst in-order (sorted ascending)
(define (bst-traverse-inorder bst)
  (if (bst-isempty? bst)
    bst
    (append (bst-traverse-inorder (bst-left bst))
            (list (bst-value bst))
            (bst-traverse-inorder (bst-right bst)))))

; Traverse bst pre-order (root, left, right)
(define (bst-traverse-preorder bst)
  (if (bst-isempty? bst)
    bst
    (append 
            (list (bst-value bst))
            (bst-traverse-preorder (bst-left bst))
            (bst-traverse-preorder (bst-right bst)))))

; Traverse bst post-order (left, right, root)
(define (bst-traverse-postorder bst)
  (if (bst-isempty? bst)
    bst
    (append 
            (bst-traverse-postorder (bst-left bst))
            (bst-traverse-postorder (bst-right bst))
            (list (bst-value bst)))))
