;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 9|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ANCHO 600)
(define ALTO 600)
(define COLOR "black")
(define TAMAÑO 50)
(define FONDO (place-image/align (rectangle ANCHO ALTO "solid" COLOR) 0 0 "left" "top" (empty-scene ANCHO ALTO)))


(define (interpretar-estado e) (cond
                                 [(string=? e "tv") (triangle TAMAÑO "solid" "green")]
                                 [(string=? e "ta") (triangle TAMAÑO "solid" "yellow")]
                                 [(string=? e "cv") (circle TAMAÑO "solid" "green")]
                                 [(string=? e "ca") (circle TAMAÑO "solid" "yellow")]
                                 )
  )
(define (dibujar e) (place-image (interpretar-estado e) (random ANCHO) (random ALTO) FONDO))
(define (key-handler e k) (cond
                            [(or (key=? k "t") (key=? k "c")) (string-append k (substring e 1 2))]
                            [#t e]
                            )
  )
(define (cambiar-color e) (cond
                            [(string=? (substring e 1 2) "v") (string-append (substring e 0 1) "a")]
                            [(string=? (substring e 1 2) "a") (string-append (substring e 0 1) "v")]
                            )
  )

(big-bang "tv"
  [to-draw dibujar]
  [on-key key-handler]
  [on-tick cambiar-color 1]
  )