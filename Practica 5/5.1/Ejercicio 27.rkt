;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ejercicio 27|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (maximo list) (cond
                        [(cons? (rest list)) (if (> (first list) (first (rest list)))
                                                 (maximo (cons (first list) (rest (rest list))))
                                                 (maximo (cons (first (rest list)) (rest (rest list)))))]
                        [(cons? list) (first list)]
                        [else 0]
                        ))

(maximo (list 1 4 6 8 2 3))