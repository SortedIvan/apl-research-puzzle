(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const N Int)

(assert (= N 4))


(assert 
    (and
        (distinct A B C D)
        (<= A N)
        (<= B N)
        (<= C N)
        (<= D N)

        (>= A 1)
        (>= B 1)
        (>= C 1)
        (>= D 1)

        (> (* A B) 10)
        (> (* D D) 1)
        (< (+ A D) 6)
    )
)


(check-sat)
(get-model)
(exit)