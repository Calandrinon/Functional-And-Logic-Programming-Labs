;; a) Write a function to return the sum of two vectors.

(defun concatenate_lists (l1 l2)
	(cond
		((null l1) l2)
		(t (cons (car l1) (concatenate_lists (cdr l1) l2)))
	))


(defun two_vectors_sum (v1 v2)
	(cond	
		((/= (length v1) (length v2)) nil)	
		((and (= (length v1) 0) (= (length v2) 0)) '())	
		(t (concatenate_lists (list (+ (car v1) (car v2))) (two_vectors_sum (cdr v1) (cdr v2))))
	))

;; b) Write a function to get from a given list the list of all atoms,
;;    on any level, but on the same order. 
;;    Example:(((A B) C) (D E)) ==> (A B C D E)

(defun same_level_atoms (l) 
	(cond
		((null l) l)		
		((not (listp l)) (list l))
		(t (concatenate_lists (same_level_atoms (car l)) (same_level_atoms (cdr l))))
	))
