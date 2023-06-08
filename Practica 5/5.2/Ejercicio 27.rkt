;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Ejercicio 27|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct alumno [nombre nota faltas])
; alumno  (String, Number, Natural). Interpretación
; - nombre representa el nombre del alumno.
; - nota representa la calificación obtenida por el alumno (entre 0 y 10).
; - faltas: número de clases a las el alumno no asistió.

(define (destacados l) (filter (lambda (x) (> (alumno-nota x) 9)) l))
(define (condicion al) (cond
                         [(>= (alumno-nota al) 8) "promovido"]
                         [(>= (alumno-nota al) 6) "regular"]
                         [#t "libre"]))
(define (exito l) (foldr (lambda (a b) (and a b)) #t (map (lambda (x) (if (string=? "libre" x) #f #t)) (map condicion l))))
(define (faltas-regulares l) (foldr + 0 (map (lambda (y) (alumno-faltas y)) (filter (lambda (x) (string=? "regular" (condicion x))) l))))
(define (promovidos-ausentes l) (filter (lambda (y) (>= (alumno-faltas y) 3)) (filter (lambda (x) (string=? "promovido" (condicion x))) l)))

(promovidos-ausentes (list (make-alumno "Juan Computación" 9 3)
                           (make-alumno "Carlos Software" 3.5 2)
                           (make-alumno "Ada Lovelace" 10 1)))