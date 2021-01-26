(defun replace-evens (list)
    (cond
        ((null list) list)
        ((and (numberp list) (= (mod list 2) 0)) (+ list 1)) 
        ((numberp list) list)
        ((symbolp list) list)
        (t (mapcar #'replace-evens list))
    ))