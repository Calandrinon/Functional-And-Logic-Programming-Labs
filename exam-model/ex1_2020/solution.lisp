(defun f (l1 l2)
    (append (f (car l1) l2)
        (cond
            ((null l1) (cdr l2))
            (t (list (f (car l1) l2) (car l2))) 
        ) 
    )
)



(defun f2 (l1 l2)
  	(let ((f-saved (f2 (car l1) l2))) 
		(append f-saved
			(cond
				((null l1) (cdr l2))
				(t (list f-saved (car l2))) 
			) 
		) 
	)
)



(defun g (l)
	(mapcon #'list l)
)

(defun h (l)
	(mapcan #'list l)
)

(apply #'append (mapcon #'g '(1 2)))


(defun rem-nils (list)
	(cond
		((null list) nil)
		((atom list) '(list))
		((null (car list)) (rem-nils (cdr list)))
		(t (append (car list) (rem-nils (cdr list))))	
	))



(defun remove-element (list element)
	(cond
		((null list) list)
		((eq (car list) element) (remove-element (cdr list) element))	
		(t (cons (car list) (remove-element (cdr list) element)))
	))


(defun rem-three (list)
	(cond
		((and (numberp list) (= (mod list 3) 0)) nil)	
		((atom list) (list list))
		(t (list (mapcan #'rem-three list)))
	))


(defun num-nodes (tree)
	(cond
		((atom tree) 1)
		(t (apply #'+ (mapcar #'num-nodes tree)))	
	))

(defun depth (tree)
	(cond 
		((null (cdr tree)) 0)
		(t (+ 1 (apply #'max (mapcar #'depth (cdr tree)))))
	))
