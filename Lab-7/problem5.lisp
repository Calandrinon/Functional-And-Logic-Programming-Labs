#| 
   5. Write a function that computes the sum of even numbers and decreases the sum of odd numbers, 
	  at any level of a list.
|#


#|
	sums(x) =
		x, x is an even number
		-x, x is an odd number
		sigma i=(1,n) sums(x_i), otherwise (x is a list)	
|#

(defun sums (x)
	(cond
	  	((and (numberp x) (evenp x)) x)
	  	((and (numberp x) (oddp x)) (- 0 x))
		(t (apply #'+ (mapcar #'sums x)))	
	))
