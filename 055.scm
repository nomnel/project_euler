(add-load-path "." :relative)
(use eulerlib)

; 総当たり
(define (e55)
  (define (reverse-num n)
    (list->integer (reverse (integer->list n))))
  (define (lychrel? n)
    (let loop ((c 1) (n (+ n (reverse-num n))))
      (cond ((< 50 c) #t)
            ((palindrome? n) #f)
            (else (loop (+ c 1) (+ n (reverse-num n)))))))
  (let loop ((n 10) (res 0))
    (cond ((< 9999 n) res)
          ((lychrel? n) (loop (+ n 1) (+ res 1)))
          (else (loop (+ n 1) res)))))