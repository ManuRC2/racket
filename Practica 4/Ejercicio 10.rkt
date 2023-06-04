;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 10|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct Estudiante [nombre promedio asistencia])
; Estudiante es (String, Number, Number)
; promedio (0-10)
; asistencia (0-100)

(define (condicion est) (if (Estudiante? est)
                            (if (< (Estudiante-asistencia est) 60)
                                "Libre"
                                (cond
                                  [(< (Estudiante-promedio est) 6) "Libre"]
                                  [(< (Estudiante-promedio est) 8) "Regular"]
                                  [(>= (Estudiante-promedio est) 8) "Promovido"])
                                )
                            "Tipo de dato invalido."
                            )
  )