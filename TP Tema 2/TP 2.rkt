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

(define CARTAS 40)
(define MAZO-ORDENADO (intervalo CARTAS))

;;;;;;;; Ejercicio 2

(define (getelem n l) (cond
                        [(zero? n) (first l)]
                        [(positive? n) (getelem (sub1 n) (rest l))]))

(define (barajar l) (cond
                      [(zero? (length l)) '()]
                      [(positive? (length l)) (local [(define RN (random (length l)))] (cons (getelem RN l) (barajar (remove (getelem RN l) l))))]))

;;;;;;;; Ejercicio 3

(define (jugar n) (cond
                    [(zero? n) '()]
                    [(positive? n) (cons (barajar MAZO-ORDENADO) (jugar (sub1 n)))]))

;;;;;;;; Ejercicio 4


(define (cartapos l) (add1 (- CARTAS (length l))))


(check-expect (perdedora? (list 9 7 15 16 14 11 18 12 5 17 8 13 4 1 19 3 20 6 2 10 9 7 15 16 14 11 18 12 5 17 8 13 4 1 19 3 20 6 2 10)) #false)
(check-expect (perdedora? (list 8 5 2 13 6 7 15 10 14 4 12 17 1 9 3 19 20 11 18 16 8 5 2 13 6 7 15 10 14 4 12 17 1 9 3 19 20 11 18 16)) #false)
(check-expect (perdedora? (list 3 10 1 15 16 8 12 2 19 7 5 13 11 14 18 6 17 20 9 4 3 10 1 15 16 8 12 2 19 7 5 13 11 14 18 6 17 20 9 4)) #true)
(check-expect (perdedora? (list 17 4 13 18 19 15 5 11 9 10 20 8 7 2 6 14 1 16 12 3 17 4 13 18 19 15 5 11 9 10 20 8 7 2 6 14 1 16 12 3)) #true)
(check-expect (perdedora? MAZO-ORDENADO) #true)
(define (perdedora? l) (cond
                         [(zero? (length l)) #f]
                         [(positive? (length l)) (if (= (cartapos l) (first l))
                                                     #t
                                                     (perdedora? (rest l)))]))

;;;;;;;; Ejercicio 5

(define (montecarlo n) (/ (* 100
                             (foldr + 0
                                    (map (lambda (x) (if x 1 0))
                                         (map perdedora? (jugar n)))))
                          n
                          )
  )

(montecarlo 5000)

#| Responda a la pregunta: ¿Le conviene o no aceptar la apuesta de Lautaro?

  Al aplicar el método montecarlo, podemos ver que el porcentaje de partidas perdedoras ronda
  aproximadamente entre 60% y 65%. Esto significa que al jugar al juego, normalmente las probabilidades
  de perder son mayores a las de ganar. Esto significa que a Rocío le conviene aceptar la apuesta,
  ya que es mas probable que Francisco pierda y, por lo tanto, ella gane su apuesta con Lautaro.


|#