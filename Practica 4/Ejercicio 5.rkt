;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 5|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ALTO 300)
(define ANCHO 300)
(define RADIO 50)
(define DELTA 10)
(define INICIAL (make-posn (/ ANCHO 2) (/ ALTO 2)))

;interpretar: Estado -> Estado
;dibuja un circulo
(define (interpretar pos) (place-image (circle RADIO "solid" "red") (posn-x pos) (posn-y pos) (empty-scene ALTO ANCHO)))

;key-handler Estado, Tecla -> Estado
;aumenta o reduce la altura dependiendo de la tecla presionada
(define (key-handler pos k) (cond
                            [(and (key=? k "up") (< 0 (- (posn-y pos) RADIO))) (make-posn (posn-x pos) (- (posn-y pos) DELTA))]
                            [(and (key=? k "down") (> ALTO (+ (posn-y pos) RADIO))) (make-posn (posn-x pos) (+ (posn-y pos) DELTA))]
                            [(and (key=? k "left") (< 0 (- (posn-x pos) RADIO))) (make-posn (- (posn-x pos) DELTA) (posn-y pos))]
                            [(and (key=? k "right") (> ANCHO (+ (posn-x pos) RADIO))) (make-posn (+ (posn-x pos) DELTA) (posn-y pos))]
                            [(key=? k " ") pos]
                            [#t pos]
                            )
  )

(define (mouse-handler pos x y event) (cond [(string=? event "button-down") (make-posn x y)]
                                            [else pos]))

(big-bang INICIAL
  [to-draw interpretar]
  [on-key key-handler]
  [on-mouse mouse-handler])