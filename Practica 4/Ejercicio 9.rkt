;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ejercicio 9|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct Auto [modelo año comb rend])
; Auto es (String, Number, String, Number)
; comb = diesel o nafta
; rend = km/l

(define AÑO 2023)
(define (edad-auto auto) (- AÑO (Auto-año auto)))
(define (precio-comb auto) (cond
                            [(string=? (Auto-comb auto) "diesel") 17]
                            [(string=? (Auto-comb auto) "nafta") 19]))
(define (peajes kms) (* 50 (floor (/ kms 100))))

(define (costo-viaje auto kms) (+
                                (* (/ kms (* (Auto-rend auto)
                                         ( / (cond
                                               [(and (>= (edad-auto auto) 1) (< (edad-auto auto) 5)) 98]
                                               [(and (>= (edad-auto auto) 5) (< (edad-auto auto) 10)) 94]
                                               [(and (>= (edad-auto auto) 10) (< (edad-auto auto) 15)) 90]
                                               [(>= (edad-auto auto) 15) 85]
                                               [#t 100]
                                               )
                                             100)))
                                  (precio-comb auto)
                                  )
                                (peajes kms)
                                )
  )

(costo-viaje (make-Auto "Golf" 2013 "nafta" 13) 450)