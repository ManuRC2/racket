;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 19|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; posns -> Number
(define (dist-origen pos) (expt (+ (* (posn-x pos) (posn-x pos)) (* (posn-y pos) (posn-y pos))) (/ 1 2)))


; List(posn) -> List(Number)
(define (distancias list) (cond
                          [(empty? list) '()]
                          [(cons? list) (cons (dist-origen (first list)) (distancias (rest list)))]))

