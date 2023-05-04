;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 4|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ALTO 300)
(define ANCHO 300)
(define RADIO 50)
(define DELTA 10)

;interpretar: Estado -> Estado
;dibuja un circulo
(define (interpretar e) (place-image (circle RADIO "solid" "red") (/ ANCHO 2) e (empty-scene ALTO ANCHO)))

;key-handler Estado, Tecla -> Estado
;aumenta o reduce la altura dependiendo de la tecla presionada
(define (key-handler e k) (cond
                            [(and (key=? k "up") (< 0 (- e RADIO))) (- e DELTA)]
                            [(and (key=? k "down") (> ALTO (+ e RADIO))) (+ e DELTA)]
                            [(key=? k " ") (/ ALTO 2)]
                            [#t e]
                            )
  )

(define (mouse-handler n x y event) (cond [(string=? event "button-down") y]
                                          [else n]))

(big-bang (/ ALTO 2)
  [to-draw interpretar]
  [on-key key-handler]
  [on-mouse mouse-handler])