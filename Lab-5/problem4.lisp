;; a) Write a function to return the sum of two vectors.

#|
	two_vectors_sum(a1a2..an, b1b2..bm) =
		null, n =/= m
		[], n = 0 and m = 0 
		(a1 + b1) U two_vectors_sum(a2..an, b2..bm), otherwise	
|#

(defun concatenate_lists (l1 l2)
	(cond
		((null l1) l2)
		(t (cons (car l1) (concatenate_lists (cdr l1) l2)))
	))


(defun two_vectors_sum (v1 v2)
	(cond	
		((/= (length v1) (length v2)) nil)	
		((and (= (length v1) 0) (= (length v2) 0)) '())	
		(t (append (list (+ (car v1) (car v2))) (two_vectors_sum (cdr v1) (cdr v2))))
	))

;; b) Write a function to get from a given list the list of all atoms,
;;    on any level, but on the same order. 
;;    Example:(((A B) C) (D E)) ==> (A B C D E)

#|
	same_level_atoms(l) =
		[], l - l1l2..ln and n = 0
		list(l), l - not a list
		same_level_atoms(l1) U same_level_atoms(l2..ln), otherwise (where l is a list)
|#

(defun same_level_atoms (l) 
	(cond
		((null l) l)		
		((not (listp l)) (list l))
		(t (append (same_level_atoms (car l)) (same_level_atoms (cdr l))))
	))


;; c) Write a function that, with a list given as parameter,
;;    inverts only continuous sequences of atoms. 
;;    Example: (a b c (d (e f) g h i)) ==> (c b a (d (f e) i h g))

#|
	invert(l, acc) =
		[], l - l1l2..ln and n = 0
		acc U invert(l1, []) U invert(l2..ln, []), l1 - l11l12..l1n
		invert(l2..ln, l1 U acc), otherwise
|#

(defun invert (l acc)
 	(cond
		((null l) acc)
		((listp (car l))
			(append acc
			(list (invert (car l) '()))
			(invert (cdr l) '()))
		)
		(t (invert (cdr l) (cons (car l) acc)))
	))

(defun invert-wrapper (l)
	(invert l '()))

;; d) Write a function to return the maximum value of the numerical atoms from a list, at superficial level.

#|
	max_list(l) =
		[], l - l1l2..ln and n = 0
		max_num(max_list(l1), max_list(l2..ln)), l1 - l11l12..l1n 				
		max_num(l1, l2), l - l1l2..ln and n = 2
		max_num(l1, max_list(l2..ln)), otherwise		
|#

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

(defun superficial-max (l)
	(cond
		((null l) nil)	
		((numberp (car l)) (max_num (car l) (superficial-max (cdr l))))
		(t (superficial-max (cdr l)))
	)
)
