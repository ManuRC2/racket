;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 23|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (longitudes list) (cond
                            [(empty? list) '()]
                            [(cons? list) (cons (string-length (first list)) (longitudes (rest list)))]))