;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 11|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct Casa [prop dir sup zona])
; Casa es (String, String, Number, String)
; zona: (A, B, C, D)

(define (precio-casa casa) (* (Casa-sup casa)
                              (cond
                                [(string=? (Casa-zona casa) "A") 20000]
                                [(string=? (Casa-zona casa) "B") 15000]
                                [(string=? (Casa-zona casa) "C") 10000]
                                [(string=? (Casa-zona casa) "D") 5000]
                                )
                              )
  )

(define (venta casa) (string-append "El señor " (Casa-prop casa)
                                    " recibirá " (number->string (if (> (precio-casa casa) 1000000)
                                                                    (* (precio-casa casa) (/ 95 100))
                                                                    (* (precio-casa casa) (/ 97 100))
                                                                    )
                                                                )
                                    " pesos por la venta de su propiedad ubicada en la calle " (Casa-dir casa) "."
                                    )
  )

(venta (make-Casa "Pedrito" "Mendoza 989" 160 "A"))