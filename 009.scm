;; Gauche 0.9.3

(define (e9)
  (any (^c (any (^b (any (^a (and (= 1000 (+ a b c))
				  (= (* c c) (+ (* b b) (* a a)))
				  (* a b c)))
			 (iota (- b 1) 1)))
		(iota (- c 1) 1)))
       (iota 500 1)))