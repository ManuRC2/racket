;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (todos-verdaderos lista) (cond
                                   [(empty? lista) #true]
                                   [(cons? lista) (and (first lista) (todos-verdaderos (rest lista)))]))

(define (uno-verdadero lista) (cond
                                   [(empty? lista) #false]
                                   [(cons? lista) (or (first lista) (uno-verdadero (rest lista)))]))