;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Ejercicio 1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define CARAS 6)
(define MAX 60000)

(define (intervalo2 n max) (cond
                             [(> n max) '()]
                             [(<= n max) (cons n (intervalo2 (add1 n) max))]))

(define (intervalo n) (intervalo2 1 n))

(define (simular-dado n) (cond
                           [(zero? n) '()]
                           [(positive? n) (cons (random (add1 CARAS)) (simular-dado (sub1 n)))]))

(define EXPERIMENTO (simular-dado MAX))
(define VALORES (intervalo CARAS))

(define (frecuencia n l) (foldr + 0 (filter (lambda (x) (= n x)) l)))

(define (frecuencia-relativa n l) (/  (frecuencia n l) (length l)))
(define (frec-rel-exp n) (frecuencia-relativa n EXPERIMENTO))

(frec-rel-exp 4)