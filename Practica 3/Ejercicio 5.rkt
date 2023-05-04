;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ANCHO 300)
(define ALTO 300)
(define RADIO 50)

(define (interpretar e)
  (place-image
   (circle RADIO "solid" e)
   (/ ANCHO 2)
   (/ ALTO 2)
   (empty-scene ANCHO ALTO)
   )
  )

(define (cambiar-color e)
  (cond
    [(string=? e "yellow") "red"]
    [(string=? e "red") "green"]
    [(string=? e "green") "blue"]
    [(string=? e "blue") "yellow"]
    )
  )

(big-bang "yellow"
  [to-draw interpretar]
  [on-tick cambiar-color 0.5])