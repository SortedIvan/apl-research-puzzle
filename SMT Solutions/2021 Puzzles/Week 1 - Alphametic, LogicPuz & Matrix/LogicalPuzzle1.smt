(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)
(declare-const F Int)
(declare-const G Int)
(declare-const H Int)
(declare-const I Int)

(assert (and 
    (<= 1 A 9) (<= 1 B 9) (<= 1 C 9)
    (<= 1 D 9) (<= 1 E 9) (<= 1 F 9)
    (<= 1 G 9) (<= 1 H 9) (<= 1 I 9)
    (distinct A B C D E F G H I)
    (= (+ A I) 5) (= (+ F H) 7)
    (= (+ E F) 6) (= (+ G I) 6)
    (= (+ B I) 9) (= (+ A D F) 13)

))

(check-sat)
(get-value (
    A B C D E F G H I
))