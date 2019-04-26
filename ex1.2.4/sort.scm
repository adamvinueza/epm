; Sorts a list of numbers (without using built-in sort)
; This one just uses a BST and in-order traversal
(load "bst.scm") ; just be sure to run this script in this directory
(define (sort lst)
  (bst-traverse-inorder (bst-add-list '() lst)))
