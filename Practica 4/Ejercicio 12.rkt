;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 12|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct Persona [nombre peso peso-u altura altura-u])
; Persona es (String, Number, String, Number, String)
; peso-u: (g, kg)
; altura-u: (m, cm)

(define (IMC persona) (if (Persona? persona)
                          (/ (if (string=? "g" (Persona-peso-u persona))
                                 (/ (Persona-peso persona) 1000)
                                 (Persona-peso persona)
                                 )
                             (expt
                              (if (string=? "cm" (Persona-altura-u persona))
                                  (/ (Persona-altura persona) 100)
                                  (Persona-altura persona))
                              2
                              )
                             )
                          "Tipo de dato incorrecto."
                          )
  )

(IMC (make-Persona "Pedrito" 70000 "g" 1.8 "m"))