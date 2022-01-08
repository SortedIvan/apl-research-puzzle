 (declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)


(assert (and (> A 0) (<= A 5)))
(assert (and (> B 0) (<= B 5)))
(assert (and (> C 0) (<= C 5)))
(assert (and (> D 0) (<= D 5)))
(assert (and (> E 0) (<= E 5)))


(assert(and (not(= A B )) (not(= A C)) (not(= A D)) (not(= A E))))
(assert(and (not(= B A )) (not(= B C)) (not(= B D)) (not(= B E))))
(assert(and (not(= C A )) (not(= C B)) (not(= C D)) (not(= C E))))
(assert(and (not(= D A )) (not(= D B)) (not(= D C)) (not(= D E))))

(assert (= (+ E 2) C))
(assert (= (+ E 1) B))
(assert (= (+ A 3) B))


(check-sat)
(get-model)