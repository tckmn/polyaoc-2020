#!/usr/bin/env racket

#lang racket

(define input (map string->number (file->lines "input")))

(define (part1 input)
  (let ([val (list-ref input 25)])
    (if
      (member val (map (curry apply +) (combinations (take input 25) 2)))
      (part1 (cdr input))
      val)))

(define (part2 input val)
  (define (helper input val num sum)
     (cond
       [(< sum val) (helper input val (add1 num) (+ sum (list-ref input num)))]
       [(> sum val) (helper (cdr input) val (sub1 num) (- sum (car input)))]
       [else (let ([slice (take input num)]) (+ (apply min slice) (apply max slice)))]))
  (helper input val 0 0))

(let ([val (part1 input)])
  (println val)
  (println (part2 input val)))
