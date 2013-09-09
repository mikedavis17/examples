
(load "fc.scm")

;;
;; fibonacci generator with a continuation
;;
;; BROKEN / POORLY CONCEIVED
;; 
(define (fgen)
  (define kn #f)
  (define n 0)
  
  (call-with-current-continuation (lambda (k) (set! kn k)))
  (let ((f (fib n)))
    (set! n (+ n 1))
    (list f kn)))




