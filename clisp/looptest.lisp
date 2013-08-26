(defun foo (x)
	(1+ x))

(defmacro noo (fn n v)
  (let ((var (gensym)))
    `(let ((,var ,v))
       (loop repeat ,n
	     do (setf ,var (list ',fn ,var)))
       (eval ,var))))

(defmacro noo2 (fn n v)
  (let ((var (gensym)))
    `(let ((,var ,v))
       (loop repeat ,n
	     do (setf ,var (funcall ',fn ,var)))
       ,var)))

(defun scroo (n v)
  (noo nosuch n v))

(defun show-1 (label forms)
  (format t "~a:~16t~a~%" label forms))

(defun doto (fn form filters)
  (mapcar #'(lambda (filter) (funcall fn
				      (car filter)
				      (funcall (cadr filter) form)))
	  filters)
  (format t "-------------------~%"))

(defun showit (forms)
  (doto 'show-1 forms (list (list "raw" 'identity) 
			    (list "expanded" 'macroexpand-1)
			    (list "evaluated" 'eval))))

(showit '(noo foo 5 1.0101))
(showit '(noo2 foo 5 1.0101))

;;(showit '(noo (lambda (var) (+ var (max var 2))) 5 1.0101))

(time (noo  foo 100000 0)) ; overflows the stack
(time (noo2 foo 100000 0))
