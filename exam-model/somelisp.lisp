(defun two_vectors_sum (l1 l2)
	(cond
	  	((and (= (length l1) 1) (= (length l2) 1)) (list (+ (car l1) (car l2))))
	  	((not (= (length l1) (length l2))) "the vectors do not have equal dimensions")	
		(t (append (list (+ (car l1) (car l2))) (two_vectors_sum (cdr l1) (cdr l2))))
	))

(defun sup (list)
  	(cond
	  	((null list) nil)
		((not (numberp (car list))) (sup (cdr list)))  
		(t (max (car list) (sup (cdr list))))
	))


(defun increment (list)
	(mapcar #'(lambda (x) (+ 1 x)) list)
)


(defun sbst (list old new)
	(cond
	  	((numberp list)
			(cond
				((= list old) new)  
				(t list)
			))
		((listp list) (mapcar #'(lambda (mylist) (sbst mylist old new)) list))
	))
