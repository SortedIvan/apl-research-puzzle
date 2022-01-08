(declare-const A Real)
(declare-const B Real)
(declare-const C Real)
(declare-const D Real)
(declare-const W Real)
(declare-const X Real)
(declare-const Y Real)
(declare-const Z Real)

(assert 
    (and 
        (= A 3)
        (= B 1)
        (= C 5)
        (= D 2)
   ))

(assert 
    (and

        (= (+(* A W) (* B Y)) 1)
        (= (+(* A X) (* B Z)) 0)
        (= (+(* C W) (* D Y)) 0)
        (= (+(* C X) (* D Z)) 1)

    ))


(check-sat)
(get-model)
(exit)