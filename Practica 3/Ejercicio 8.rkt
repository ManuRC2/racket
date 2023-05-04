;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 8|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define COLOR-FONDO "black")
(define ANCHO-FONDO 1200)
(define ALTO-FONDO 800)
(define COLOR-ESTRELLA "yellow")
(define ANCHO-ESTRELLA 80)
(define ALTO-ESTRELLA 80)
(define FONDO (rectangle ANCHO-FONDO ALTO-FONDO "solid" COLOR-FONDO))

(define (dibujar e) (place-image/align e 0 0 "left" "top" (empty-scene ANCHO-FONDO ALTO-FONDO)))
(define (key-handler e k) (cond
                            [(key=? k "\b") FONDO]
                            [#t e]
                            )
  )
(define (mouse-handler e x y k) (cond
                                  [(mouse=? k "button-down")
                                   (if (and (>= ANCHO-FONDO (+ x ANCHO-ESTRELLA)) (<= 0 (- x ANCHO-ESTRELLA))
                                            (>= ALTO-FONDO (+ y ALTO-ESTRELLA)) (<= 0 (- y ALTO-ESTRELLA)))
                                      (place-image (star (/ (* x ANCHO-ESTRELLA) 1200) "solid" COLOR-ESTRELLA) x y e)
                                      e)]
                                  [#t e]
                                  )
  )

(big-bang FONDO
  [to-draw dibujar]
  [on-key key-handler]
  [on-mouse mouse-handler]
  )