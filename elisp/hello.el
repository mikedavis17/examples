:;exec emacs -q -batch -l $0 -f main $*

;; we want this in emacs 22+:  #!/usr/bin/emacs --script

(defun main ()
  (message "hello, world")
  (message (apply 'concat command-line-args-left)))
