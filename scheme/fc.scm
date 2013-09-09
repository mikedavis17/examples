
;;
;; Fibonacci function implemented with a continuation
;; 
(define (fib n)
  (define kn #f)
  (define a 0)
  (define b 1)

  (call-with-current-continuation (lambda (k) (set! kn k)))
  (let ((aa b)
	(bb (+ a b)))
    (if (= n 0)
	a
	(begin
	  (set! a aa)
	  (set! b bb)
	  (set! n (- n 1))
	  (kn)))))




