;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |TP 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#| Trabajo Práctico Final - Tema 2

Integrantes:
- [Calligari, Santiago]
- [Colusso, Manuel]
|#

;;;;;;;; Ejercicio 1

(define (intervalo n) (range 1 (add1 n) 1))

(define CARTAS 20)
(define MAZO-ORDENADO (intervalo CARTAS))

;;;;;;;; Ejercicio 2

(define (getelem n l) (cond
                        [(zero? n) (first l)]
                        [(positive? n) (getelem (sub1 n) (rest l))]))

(define (barajar l) (cond
                          [(zero? (length l)) '()]
                          [(positive? (length l)) (local [(define RN (random (length l)))] (cons (getelem RN l) (barajar (remove (getelem RN l) l))))]))

(barajar-pro MAZO-ORDENADO)

;;;;;;;; Ejercicio 3

; [Completar]

;;;;;;;; Ejercicio 4

; [Completar]

;;;;;;;; Ejercicio 5

; [Completar]

#| Responda a la pregunta: ¿Le conviene o no aceptar la apuesta de Lautaro?

  [Completar]

|#