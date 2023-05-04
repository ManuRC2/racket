;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Editor de texto|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (dibujar e) (place-image/align (text e 20 "indigo")
                   0 0 "left" "top" (empty-scene 800 60)))


(define (key-handler e k)
  (cond
    [(key=? k "\b") (substring e 0 (if (= (string-length e) 0) 0 (- (string-length e) 1)))]
    [(= (string-length k) 1) (string-append e k)]
    [#t e]))


(big-bang ""
  [to-draw dibujar]
  [on-key key-handler]
  )