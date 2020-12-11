#| 8. Return the list of nodes of a tree of type (2) accessed inorder. |#

#|
	inorder(t1t2t3) =
		tree, if len(t) is 1 (if the subtree is a list with one element)
		inorder(t2)  U  t1  U  inorder(t3), otherwise

|#

(defun inorder (tree)
	(cond
	  	((= (length tree) 1) tree)
		(t (append (inorder (cadr tree)) (list (car tree)) (inorder (caddr tree))))
	)
)


#|       A
		/ \
	   B   C
          / \
         D   E
|#
