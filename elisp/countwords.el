:;exec emacs -q -batch -l $0 -f main $*

;; we want this in emacs 22+:  #!/usr/bin/emacs --script

(defun main ()
  (mapcar 'countwords command-line-args-left))

(defun countwords (name)
  (set-buffer (find-file name))
  (message (format "%s %d" name (length (split-string (buffer-string)))))
  (kill-buffer nil))
