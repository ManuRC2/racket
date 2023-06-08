;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Ejercicio 25|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (long-lists l) (foldr (lambda (a b) (and a b)) #t (map (lambda (x) (> x 4)) (map (lambda (y) (foldr + 0 (map (lambda (z) 1) y)))l))))