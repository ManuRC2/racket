;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |TP 2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
#| Trabajo Práctico Final - Tema 2

Integrantes:
- [Calligari, Santiago]
- [Colusso, Manuel]
|#

;;;;;;;; Ejercicio 1

;intervalo: Natural -> List(Natural)
;recibe un numero n y devuelve una lista ordenada de los numeros naturales desde 1 hasta n
(check-expect (intervalo 1) (list 1))
(check-expect (intervalo 3) (list 1 2 3))
(check-expect (intervalo 10) (list 1 2 3 4 5 6 7 8 9 10))
(check-expect (intervalo 0) '())
(define (intervalo n) (range 1 (add1 n) 1))

; constantes

; CARTAS: cantidad de cartas del mazo con el que se juega
(define CARTAS 40)

; MAZO-ORDENADO: el mazo ordenado inicial con cantidad de cartas = CARTAS
(define MAZO-ORDENADO (intervalo CARTAS))

;;;;;;;; Ejercicio 2

; getelem: Natural, List(a) -> a
; recibe un numero Natural n y una Lista, y devuelve el elemento de la lista en la pocisión n (comenzando en 0)
; si la longitud de la lista no es suficiente como para conseguir el elemento, devuelve '()
(check-expect (getelem 0 (list 1 2 3)) 1)
(check-expect (getelem 2 (list 1 2 3)) 3)
(check-expect (getelem 5 MAZO-ORDENADO) 6)
(check-expect (getelem 4 (list 1 2 3)) '())
(define (getelem n l) (cond
                        [(zero? (length l)) '()]
                        [(zero? n) (first l)]
                        [(positive? n) (getelem (sub1 n) (rest l))]))

; barajar: List -> List
; recibe una lista y devuelve una lista con los mismos elementos pero re-ordenados aleatoriamente
(define (barajar l) (cond
                      [(zero? (length l)) '()]
                      [(positive? (length l)) (local [(define RN (random (length l)))]
                                                (cons (getelem RN l) (barajar (remove (getelem RN l) l))))]))

;;;;;;;; Ejercicio 3

; jugar: Natural -> List(List)
; recibe un numero n y devuelve una lista de n listas resultantes de aplicar barajar a MAZO-ORDENADO
; es decir, devuelve una lista de n mazos desordenados
(define (jugar n) (cond
                    [(zero? n) '()]
                    [(positive? n) (cons (barajar MAZO-ORDENADO) (jugar (sub1 n)))]))

;;;;;;;; Ejercicio 4

; cartapos: List -> Number
; recibe una lista y devuelve 1 + la diferencia entre la longitud de la misma y la constante CARTAS
; es simplemente una funcion auxiliar de la función perdedora, que se usa para ver cuantos elementos se sacaron de la lista inicial
(check-expect (cartapos MAZO-ORDENADO) 1)
(check-expect (cartapos (rest MAZO-ORDENADO)) 2)
(check-expect (cartapos '()) (add1 CARTAS))
(check-expect (cartapos (list 1)) CARTAS)
(define (cartapos l) (add1 (- CARTAS (length l))))

; perdedora?: List -> Boolean
; recibe una lista y devuelve #true si el valor de algun elemento coincide con su posición, y #false en caso contrario
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

; montecarlo: Natural -> Number
; recibe un natural n y devuelve el porcentaje de juegos perdidos, resultado de jugar n veces al mismo
(define (montecarlo n) (/ (* 100
                             (foldr + 0
                                    (map (lambda (x) (if x 1 0))
                                         (map perdedora? (jugar n)))))
                          n
                          )
  )

#| Responda a la pregunta: ¿Le conviene o no aceptar la apuesta de Lautaro?

  Al aplicar el método montecarlo, podemos ver que el porcentaje de partidas perdedoras  ronda
  aproximadamente entre 60% y 65%. Esto significa que al jugar al juego, normalmente las probabilidades
  de perder son mayores a las de ganar. Esto significa que a Rocío le conviene aceptar la apuesta,
  ya que es mas probable que Francisco pierda y, por lo tanto, ella gane su apuesta con Lautaro.


|#