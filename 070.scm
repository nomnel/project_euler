(add-load-path "." :relative)
(use eulerlib)

(define (e70)
  (define (permutation? a b)
    (every = (sort (integer->list a)) (sort (integer->list b))))
  (let* ((L (expt 10 7))
         (ll (* 0.7 (sqrt L)))
         (min-q L)
         (min-n L))
    (let loop ((ps (filter (cut > <> ll)
                           (primes (floor->exact (* 1.3 (sqrt L)))))))
      (unless (null? ps)
        (let1 p1 (car ps)
          (dolist (p2 (cdr ps))
            (let* ((n (* p1 p2))
                   (phi (* (- p1 1) (- p2 1)))
                   (q (/. n phi)))
              (when (and (< n L)
                         (permutation? n phi)
                         (< q min-q))
                (set! min-q q)
                (set! min-n n))))
          (loop (cdr ps)))))
    min-n))