
(define (subsets set)
  (subset-helper (list (list)) (reverse set)))

(define (subset-helper partial set)
  (if (null? set)
      partial
    (subset-helper
     (append (map (lambda (x) (cons (car set) x)) partial) partial)
     (cdr set))))

(define (histogram vals)
  (histogram-helper '() vals))

(define (histogram-helper hg vals)
  (if (null? vals)
      hg
    (let* ((val (car vals))
	   (rest (cdr vals))
	   (found (assq val hg)))
      (histogram-helper (append (list (cons val (1+ (if found (cdr found) 0))))
				(assq-remove! hg val))
			rest))))

(define (repeat count what)
  (repeat-helper '() count what))

(define (repeat-helper out count what)
  (if (<= count 0)
      out
    (repeat-helper (append (list what) out) (1- count) what)))

(define (range low high)
  (range-helper '() low high))

(define (range-helper out low high)
  (if (> low high)
      out
    (range-helper (cons high out) low (1- high))))

;(range 1 5)

;(subsets '())
;(subsets (range 1 1))
;(subsets (range 1 3))
;(subsets (range 1 6))

;(map (lambda (x) (apply + x)) (subsets (range 1 6)))

(define (test-histogram l)
  (for-each (lambda (x) (display x) (display "\n")) 
	    (sort (histogram l) (lambda (a b) (< (car a) (car b))))))

;(test-histogram (map (lambda (x) (apply + x)) (subsets (range 1 6))))
;(test-histogram (append (repeat 100 10) (repeat 25 6)))

