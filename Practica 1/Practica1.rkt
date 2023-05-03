;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (angosta? x)
(cond [(> (image-width x) (image-height x)) "Ancha"]
[(< (image-width x) (image-height x)) "Angosta"]
[#t "Cuadrada"]))

(define (sgn2 x) (cond [(< x 0) -1]
[(= x 0) 0]
[(> x 0) 1]))


(define (triangulo? a b c)
(cond [(> (+ a b c) 180) "No es un triangulo"]
[(= a b c) "Equilatero"]
[(or (= a b) (= b c) (= c a)) "Isosceles"]
[#t "Escaleno"]))

(define (pitagorica? a b c)
(cond [(=(+ (* a a) (* b b)) (* c c)) #true]
[(=(+ (* c c) (* b b)) (* a a)) #true]
[(=(+ (* a a) (* c c)) (* b b)) #true]
[#true #false]))

(define (angosta2? x)
(cond [(> (image-width x) (image-height x))
(if (> (image-width x) (* 2 (image-height x))) "Muy ancha" "Ancha")]
[(< (image-width x) (image-height x))
(if (> (image-height x) (* 2 (image-width x))) "Muy angosta" "Angosta")]
[#t "Cuadrada"]))

(define (clasificar t) (cond [(< t 0) "Muy frío (MF)"]
[(and (> t 0) (<= t 15)) "Frío (F)"]
[(and (> t 15) (< t 25)) "Agradable (A)"]
[(> t 25) "Caluroso (C)"]))

(define (clasificar2 t) (cond [(> t 25) "Caluroso (C)"]
[(> t 15) "Agradable (A)"]
[(> t 0) "Frío (F)"]
[#t "Muy frío (MF)"]))

(define (sgn4 x) (cond [x 1]
[#t 0]))

(define (sgn5 x)
(cond [(> (image-width x) (image-height x)) 1]
[(< (image-width x) (image-height x)) -1]
[#t 0]))

(define (sgn17 x) (cond [(number? x) (sgn2 x)]
[(boolean? x) (sgn4 x)]
[(image? x) (sgn5 x)]
[(string? x) (if (number? (string->number x)) (sgn2 (string->number x)) "No se puede pasar str a num")]
[else "no se que e"]))
