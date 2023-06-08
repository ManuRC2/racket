;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Ejercicio 7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (eliminar n l) (local [(define (not-e x) (not (= n x)))] (filter not-e l)))
(define (eliminar2 n l) (filter (lambda (x) (not (= x n))) l))