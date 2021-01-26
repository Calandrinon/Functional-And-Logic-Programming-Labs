(defun f (x &rest y) 
    (cond 
        ((null y) x) 
        (t (append x (mapcar #'car y)))
    ))

(defun zero-replacer (list k &optional (lvl 0))
    (cond
        ((and (atom list) (= k lvl)) 0)
        ((atom list) list)
        (t (mapcar #'(lambda (l) (zero-replacer l k (+ lvl 1))) list))
    ))