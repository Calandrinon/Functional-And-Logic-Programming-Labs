(defun repl-odd-e (list e &optional (lvl -1))
    (cond
        ((null list) list)
        ((and (atom list) (= (mod lvl 2) 1)) e)
        ((atom list) list)
        (t (mapcar #'(lambda (l) (repl-odd-e l e (+ lvl 1))) list))  
    )
)

(defun Fct (F L)
    (cond
        ((null L) nil)
        ((funcall F (car L)) (cons (funcall F (car L)) (Fct F (cdr L)))) 
        (t nil)
    ))


(defun Fct2 (F L)
    ((lambda (saved-f)
        (cond
            ((null L) nil)
            (saved-f (cons saved-f (Fct2 F (cdr L)))) 
            (t nil)
        )
     )
     (funcall F (car L))
    )
)

(defun Fct3 (F L)
    (lambda (p)
        (cond
            ((null L) nil)
            (p (cons p (Fct3 F (cdr L))))
            (t nil)
        )
    (funcall F(car L))
    )
)


(defun subm (l)
    (cond
        ((null l) (list nil)) 
        (t (append (subm (car l)) ))
    ))


(defun dbl (l)  
    (cond
        ((symbolp l) l)
        ((numberp l) (* l 2))
        (t (mapcar #'dbl l)) 
    ))


(defun all-atoms (l)
    (cond
        ((atom l) (list l))
        (t (apply #'append (mapcar #'all-atoms l))) 
    ))

(defun occ (l e)
    (cond 
        ((eq l e) 1) 
        ((atom l) 0)
        (t (apply #'+ (mapcar #'(lambda (list) (occ list e)) l)))
    )
)


(defun del-neg (list)
    (cond
        ((and (numberp list) (< list 0)) nil)
        ((atom list) (list list)) 
        (t (list (apply #'append (mapcar #'del-neg list))))
    ))


(defun rem-small (list)
    (cond
        ((and (numberp list) (< list 2)) nil) 
        ((atom list) (list list))
        (t (list (mapcan #'rem-small list)))
    ))

(defun rem-el (list el)
    (cond
        ((and (atom list) (eq list el)) nil) 
        ((atom list) (list list))
        (t (list (mapcan #'(lambda (l) (rem-el l el)) list)))
    ))

(defun delete-negs (list)
    (cond
        ((and (numberp list) (< list 0)) nil) 
        ((atom list) (list list))
        (t (list (mapcan #'delete-negs list)))
    ))

(defun del-wrapper (list)
    (car (delete-negs list))
)