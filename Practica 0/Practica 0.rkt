;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 0|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;(> (cos 0) 0)
;(= (string-length "Hola mundo") 14)
;(and (< pi 4) (> pi 3))
;(= (* 5 5) (sqrt 625))
;(not (= (substring "Ada Lovelace" 2 3) "a"))
(define (cuadro x y) ( sqrt (+ (* x x) (* y y))))
(define (dist-puntos x1 y1 x2 y2)
(sqrt (+ (* (- x1 x2) (- x1 x2)) (* (- y1 y2) (- y1 y2)))))
(define (vol-cubo x) (* x x x))
(vol-cubo 3)
(define (area-cubo x) (* 6 (* x x)))
(area-cubo 3)
(define (pitagoriga? x y z) (= (+ (* x x) (* y y)) (* z z)))
(pitagoriga? 6 8 11)
(define (suma-long x y) (+(string-length x) (string-length y)))
(suma-long "Hola" "aa")
(define (comienzaA? x) (string=? "A" (substring x 0 1)))
(comienzaA? "hola")
(define (poner- x i) (string-append
(string-append
(substring x 0 i) "-")
(substring x i (string-length x))))

(poner- "holaa" 4)