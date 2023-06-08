;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 14|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (mayores n list) (cond
                          [(empty? list) '()]
                          [(cons? list) (if (> (first list) n)
                                            (cons (first list) (mayores n (rest list)))
                                            (mayores n (rest list)))]))