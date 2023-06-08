;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Ejercicio 9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; posn -> number
(define (dist-origen pos) (expt (+ (* (posn-x pos) (posn-x pos)) (* (posn-y pos) (posn-y pos))) (/ 1 2)))

(define (distancias lista) (map dist-origen lista))
