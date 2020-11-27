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


;; c) Write a function that, with a list given as parameter,
;;    inverts only continuous sequences of atoms. 
;;    Example: (a b c (d (e f) g h i)) ==> (c b a (d (f e) i h g))

(defun invert (list &optional acc)
 	(cond
		((null list) acc)
		(t 
			(typecase (car list)
				(list
					(append acc
					(list (invert (car list)))
					(invert (cdr list)))
				)
				(t (invert (cdr list) (cons (car list) acc)))
			)
		)))

;; d) Write a function to return the maximum value of the numerical atoms from a list, at superficial level.

(defun max_num (a b) 
  	(cond
	  	((equal a nil) b)
	  	((equal b nil) a)
		((> a b) a)
		(t b)
	))

(defun max_list (l)
	(cond
	  	((null l) nil)
		((listp (car l)) (max_num (max_list (car l)) (max_list (cdr l))))
	  	((= (length l) 2) (max_num (car l) (car (cdr l))))
		(t (max_num (car l) (max_list (cdr l))))
	))

