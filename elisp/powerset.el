:;exec emacs -q -batch -l $0 -f main $*

;; we want this in emacs 22+:  #!/usr/bin/emacs --script



(defun main ()
  (print (powerset command-line-args-left)))

(defun powerset (set)
  (if (= (length set) 0)
      '(())
    (let ((prefix (car set))
	  (suffix (powerset (cdr set))))
      (append
       suffix
       (mapcar (lambda (partial) (cons prefix partial)) suffix)))))

