:;exec emacs -q -batch -l $0 -f main $*

;; we want this in emacs 22+:  #!/usr/bin/emacs --script

;; hook
(defvar gen-before-generate-population-hooks nil)

(defun main ()
  (add-hook 'gen-before-generate-population-hooks
	    (lambda ()
	      (princ "hi")
	      (terpri)))
  (generate-population))

(defun generate-population ()
  (princ "entering generate-population")
  (terpri)
  (run-hooks 'gen-before-generate-population-hooks)
  (princ "leaving generate-population")
  (terpri))
