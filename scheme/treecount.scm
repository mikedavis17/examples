
(load "ig.scm")

(define *counttree-memo* (list (cons 0 1) (cons 1 1)))
(define (counttree-memo n)
  (if (< n 0)
      0
      (let ((memo (assq n *counttree-memo*)))
	(if memo
	    (cdr memo)
	    (let* ((a (counttree-memo (- n 1)))
		   (b (cons 0 (take-stream (make-integer-stream) (- n 2))))
		   (c (map counttree-memo b))
		   (d (apply + c))
		   (e (+ (* a d) (/ (* a (+ a 1)) 2))))
	      (set! *counttree-memo* (cons (cons n e) *counttree-memo*))
	      e)))))
  
(define (counttree n) (counttree-memo n))

(define nlist (take-stream (make-integer-stream) 10))
(define (ctt alist)
  (display (map counttree alist))
  (newline))
