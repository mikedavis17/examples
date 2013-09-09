

(define (make-integer-stream)
  (define current 1)
  (lambda ()
    (let ((n current))
      (set! current (+ current 1))
      n)))

(define (make-random-stream)
  (lambda ()
    (random 1.0)))

(define (make-filtered-stream raw pred)
  (define (fs) 
    (let ((v (raw))) (if (pred v) v (fs))))
  (lambda ()
    (fs)))

(define (make-mapped-stream raw op)
  (lambda ()
    (op (raw))))

(define (make-odd-stream)
  (make-filtered-stream (make-integer-stream) odd?))

(define (make-even-stream)
  (make-filtered-stream (make-integer-stream) even?))

(define (make-doubled-stream)
  (make-mapped-stream (make-integer-stream)
		      (lambda (n) (* n 2))))

(define (take-stream s n)
  (define (helper results count)
    (if (<= count 0)
	results
	(helper (append results (list (s))) (- count 1))))
  (helper '() n))

(define (drop-stream s n)
  (if (<= count 0 n)
      s
      (begin 
	(s) 
	(drop-stream s (- n 1)))))


