;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname prueba1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define
   (interpretar s)
   (place-image (circle 10 "solid" s) 100 100 (empty-scene 200 200)))

; manejarTeclado: Estado String -> Estado
(define (manejarTeclado s k) (cond [(key=? k " ") "blue"]
                                   [(key=? k "a") "blue"]
                                   [(key=? k "r") "red"]
                                   [(key=? k "v") "green"]
                                   [(key=? k "n") "black"]
                                   [(key=? k "x") "terminar"]
                                   [else s]))

(define (terminar? e) (string=? "terminar" e))

(big-bang "blue"                   ; estado inicial del sistema
 
          [to-draw interpretar]    ; dibuja en la pantalla 
                                   ; el círculo en el estado actual
 
          [on-key manejarTeclado]  ; cuando se presiona una tecla,
                                   ; la función manejarTeclado
                                   ; se invoca para manejar el evento
          [stop-when terminar?]
)
