;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 3|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define RADIO 80)

; interpretar-color : Number -> String
; recibe el radio del circulo y devuelve el color que el mismo debe tener
(define (interpretar-color n) (cond [(<= n 50) "yellow"]
                                    [(< n 100) "red"]
                                    [#t "green"]
                                    )
  )


; interpretar : Number -> Image
; transforma el estado del sistema en una imagen a mostrar a través
; de la cláusula to-draw
(define
   (interpretar n)
   (place-image (circle n "solid" (interpretar-color n)) 150 150 (empty-scene 300 300)))

; decrementar : Number -> Number
; Devuelve el predecesor de un número positivo.
; Si el número es 0, devuelve 100. 
  (define (decrementar n) (cond
                              [(< 0 n) (- n 1)]
                              [#t 100]
                            )
    )

  ; incrementar : Number -> Number
  ; suma uno a su argumento
  (define (incrementar n) (cond
                              [(> 150 n) (+ n 1)]
                              [#t 0]
                            )
    )


  (define (terminar? e) (or (< e 10) (> e 110)))
  

  (define (key-handler e k) (if (number? (string->number k)) (* 10 (string->number k)) e))

  (big-bang RADIO                 ; estado inicial del sistema
          [to-draw interpretar]
          [on-key key-handler]
          [on-tick incrementar]
          [stop-when terminar?]
    )



  