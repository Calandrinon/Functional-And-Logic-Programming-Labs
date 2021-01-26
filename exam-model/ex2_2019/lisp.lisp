(defun replace-even (list) 
    (cond
        ((and (listp list) (null list)) '())
        ((symbolp (car list)) (append (list (car list)) (replace-even (cdr list))))
        ((numberp (car list)) 
            (cond 
                ((= (mod (car list) 2) 0) (append (list (+ 1 (car list))) (replace-even (cdr list))))
                (t (append (list (car list)) (replace-even (cdr list))))
            ))
        (t (cons (replace-even (car list)) (replace-even (cdr list))))
    ))



(defun even-max-lists (list level)
    (cond
	  	((numberp list) list)
		((and (listp list) (= (mod level 2) 1) (= (mod (max list) 2) 0)) (print list))	
		((listp list) (mapcar #'(lambda (l) (even-max-lists l (+ level 1))) list))
    ))


(defun triple (list)
	(cond
	  	((numberp list) (* 3 list))
	  	((symbolp list) list)
		((listp list) (mapcar #'triple list))  
	))


(defun prod (list)
	(cond
	  	((numberp list) list)
	  	((symbolp list) 1)
		((listp list) (apply #'* (mapcar #'prod list)))	  
	))

(defun count-even (tree level)
	(cond
		((and (atom tree) (= (mod level 2) 0)) 1)
		((atom tree) 0) 
		(t (apply #'+ (mapcar #'(lambda (tr) (count-even tr (+ 1 level))) tree)))
	))



(defun CountEven(tree lvl)
	(cond
		((and (atom tree) (evenp lvl)) 1)
		((atom tree) 0)
		(t (apply #'+ (mapcar #'(lambda (a) (CountEven a (+ lvl 1))) tree)))
	))

(defun mymax (list)
 	(cond
	  	((numberp list) list)
		((symbolp list) 0) 
		(t (apply #'max (mapcar #'mymax list)))
	) 
)


(defun odd-levels (list level) 
 	(cond
	  	((atom list) list)
		((and (oddp level) (evenp (mymax list))) 1)
		(t (apply #'+ (mapcar #'(lambda (l) (odd-levels l (+ level 1))) list)))
	) 
)


(defun verify (list)
	(cond
	 	((= (car list) 5) t) 
		((numberp (car list)) nil)
		((atom (car list)) (verify (cdr list)))
		((null list) nil)	  
		(t (and (verify (car list)) (verify (cdr list))))
	) 
)
