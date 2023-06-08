;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; contiene? : String, String-list -> Booleano
; dado un String y una lista de Strings, determina si el String es un elemento de la lista
 
(check-expect (contiene "Marcos" '()) #false)
(check-expect (contiene "Marcos" (cons "Sara" (cons "Pedro"  (cons "Esteban" '())))) #false)
(check-expect (contiene "Marcos" (cons "A" (cons "Marcos" (cons "C" '())))) #true)
(check-expect (contiene "Marcos" (cons "Juan" '())) #false)
(check-expect (contiene "Marcos" (cons "Marcos" '())) #true)
 
(define (contiene c l) (cond [(empty? l) #false]
                             [(cons? l) (if (string=? (first l) c)
                                            #true
                                            (contiene c (rest l)))]))