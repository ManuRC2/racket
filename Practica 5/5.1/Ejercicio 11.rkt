;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (sum-list list) (cond
                          [(empty? list) 0]
                          [(cons? list) (+ (first list) (sum-list (rest list)))]))

(define (cont-list list) (cond
                          [(empty? list) 0]
                          [(cons? list) (+ 1 (cont-list (rest list)))]))

(define (prom-list list) (/ (sum-list list) (cont-list list)))
