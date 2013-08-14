(add-load-path "." :relative)
(use eulerlib)

(define (e66)
  (define (next n-1 n-2 a)
    (+ (* a n-1) n-2))
  (define (continued-fraction-convergents D)
    (let* ((r (continued-fraction D))
           (a (cons (car r) (cadr r)))
           (h0 (car a)) (h1 (next h0 1 (cadr a)))
           (k0 1) (k1 (cadr a)))
      (^()
         (if (= 2 (length a))
             (values h1 k1)
             (let loop ((hn-2 h0) (hn-1 h1)
                        (kn-2 k0) (kn-1 k1)
                        (a (cddr a)))
               (if (null? (cdr a))
                   (begin
                     (set! h0 (next hn-1 hn-2 (car a)))
                     (set! h1 (next h0 hn-1 (caadr r)))
                     (set! k0 (next kn-1 kn-2 (car a)))
                     (set! k1 (next k0 kn-1 (caadr r)))
                     (set! a (cddr r))
                     (values hn-1 kn-1))
                   (loop hn-1 (next hn-1 hn-2 (car a))
                         kn-1 (next kn-1 kn-2 (car a))
                         (cdr a))))))))
  (define (solve D)
    (let1 cfc (continued-fraction-convergents D)
      (let loop ()
        (receive (x y) (cfc)
                 (if (= 1 (- (* x x) (* D y y)))
                     (values x y)
                     (loop))))))

  (car (fold (^(d m) (receive (x y) (solve d)
                              (if (> x (cadr m)) `(,d ,x) m)))
             '(0 0)
             (filter (^n (> n (expt (floor->exact (sqrt n)) 2)))
                     (iota 1000 1)))))