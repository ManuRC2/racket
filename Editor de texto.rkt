;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Editor de texto|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct Texto [s color tam])
; Texto es (String, Color, Number)
; Intepretación: El primer elemento es la cadena a mostarse, mientras que el segundo y
; el tercero determinan el color y tamaño de la fuente en píxeles respectivamente.

(define ESTADO_INICIAL (make-Texto "" "black" 20))
(define DELTA_TAM 2)

(define (dibujar e) (place-image/align (text (Texto-s e)
                                             (Texto-tam e)
                                             (Texto-color e))
                   0 0 "left" "top" (empty-scene 800 300)))


(define (key-handler e k)
  (cond
    [(key=? k "\b") (make-Texto (substring (Texto-s e) 0 (if (= (string-length (Texto-s e)) 0)
                                                   0
                                                   (- (string-length (Texto-s e)) 1)))
                                           (Texto-color e)
                                           (Texto-tam e))]
    [(key=? k "down") (if (> (Texto-tam e) DELTA_TAM)
                    (make-Texto (Texto-s e) (Texto-color e) (- (Texto-tam e) DELTA_TAM))
                    e)]
    [(key=? k "up") (if (< (Texto-tam e) (- 256 DELTA_TAM))
                    (make-Texto (Texto-s e) (Texto-color e) (+ (Texto-tam e) DELTA_TAM))
                    e)]
    [(key=? k "f1") (make-Texto (Texto-s e) "red" (Texto-tam e))]
    [(key=? k "f2") (make-Texto (Texto-s e) "green" (Texto-tam e))]
    [(key=? k "f3") (make-Texto (Texto-s e) "blue" (Texto-tam e))]
    [(key=? k "f4") (make-Texto (Texto-s e) "yellow" (Texto-tam e))]
    [(key=? k "f5") (make-Texto (Texto-s e) "orange" (Texto-tam e))]
    [(key=? k "f6") (make-Texto (Texto-s e) "black" (Texto-tam e))]
    [(= (string-length k) 1) (make-Texto (string-append (Texto-s e) k)
                                         (Texto-color e)
                                         (Texto-tam e))]
    [#t e]))


(big-bang ESTADO_INICIAL
  [to-draw dibujar]
  [on-key key-handler]
  )