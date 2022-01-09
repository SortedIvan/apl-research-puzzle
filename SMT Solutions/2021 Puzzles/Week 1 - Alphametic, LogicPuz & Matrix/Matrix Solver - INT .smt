(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)

(declare-const invA Real)
(declare-const invB Real)
(declare-const invC Real)
(declare-const incD Real)

(assert 
    (and 
        (= A 4)
        (= B 7)
        (= C 2)
        (= D 6)
   ))

(assert 
    (and

        (=  (+(* A invA) (* B invC)) 1)
        (=  (+(* A invB) (* B incD)) 0)
        (=  (+(* C invA) (* D invC)) 0)
        (=  (+(* C invB) (* D incD)) 1)

    ))


(check-sat)
(get-model)
