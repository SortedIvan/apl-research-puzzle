(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)

(assert (and(< A 5) (> A 0)))
(assert (and(< B 5) (> B 0)))
(assert (and(< C 5) (> C 0)))
(assert (and(< D 5) (> D 0)))

(assert(and (not(= A B )) (not(= A C)) (not(= A D))))
(assert(and (not(= B A )) (not(= B C)) (not(= B D))))
(assert(and (not(= C A )) (not(= C B)) (not(= C D))))
(assert(and (not(= D A )) (not(= D B)) (not(= D C))))

(assert (< (* C C) 3))
(assert (> (* B D) 10))
(assert (not (= (+ B C ) 5)))

(check-sat)
(get-model)