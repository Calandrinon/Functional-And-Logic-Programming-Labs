#| 
   5. Write a function that computes the sum of even numbers and decreases the sum of odd numbers, 
	  at any level of a list.
|#


#|
	sums(list) =
		list, list is an even number
		-list, list is an odd number
		Σ i=(1,n) sums(list_i), otherwise (in this case, 'list' is actually a list)	
|#

(defun sums (list)
	(cond
	  	((and (numberp list) (evenp list)) list)
	  	((and (numberp list) (oddp list)) (- 0 list))
		(t (apply #'+ (mapcar #'sums list)))	
	))
