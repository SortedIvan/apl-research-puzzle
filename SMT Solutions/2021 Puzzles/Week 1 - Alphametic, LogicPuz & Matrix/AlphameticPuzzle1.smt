;MENTAL + HEALTH = MATTERS
(declare-const M Int)
(declare-const E Int)
(declare-const N Int)
(declare-const T Int)
(declare-const A Int)
(declare-const L Int)
(declare-const H Int)
(declare-const R Int)
(declare-const S Int)
(declare-const FirstWord Int)
(declare-const SecondWord Int)
(declare-const Result Int)

;M, E , N, T, A, L, H, R, S
(assert (and

    (<= 0 M 9) (<= 0 E 9) (<= 0 N 9) (<= 0 T 9)
    (<= 0 A 9) (<= 0 L 9) (<= 0 H 9) (<= 0 R 9)
    (<= 0 S 9)
    (distinct M E N T A L H R S)
    (not (= M 0)) (not (= H 0))

    (= (+ (* M 100000) (* E 10000) (* N 1000) (* T 100) (* A 10) L) FirstWord)
    (= SecondWord (+ (* H 100000) (* E 10000) (* A 1000) (* L 100) (* T 10) H))
    (= Result (+ (* M 1000000) (* A 100000) (* T 10000) (* T 1000) (* E 100) (* R 10) S))
    (= (+ FirstWord SecondWord) Result)

))

(check-sat)
(get-value (
    M E N T A L H R S
))