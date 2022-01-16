(declare-fun Animal (Int) Int)
(declare-fun Drink (Int) Int)
(declare-fun Color (Int) Int)

(declare-fun AnimalA (Int) String)
(declare-fun DrinkA (Int) String)
(declare-fun ColorA (Int) String)

(define-fun DifferentValues ((v1 Int) (v2 Int) (v3 Int)) Bool
    (and
        (distinct (Animal v1) (Animal v2) (Animal v3))
        (distinct (Drink v1) (Drink v2) (Drink v3))
        (distinct (Color v1) (Color v2) (Color v3))
    )
)


;1pink,2red,3yellow
;1fish,2mouse,3zebra
;1tea,2coffee,3beer


(assert (and

    (<= 1 (Animal 1) 3) (<= 1 (Animal 2) 3) (<= 1 (Animal 3) 3)
    (<= 1 (Drink 1) 3) (<= 1 (Drink 2) 3) (<= 1 (Drink 3) 3)
    (<= 1 (Color 1) 3) (<= 1 (Color 2) 3) (<= 1 (Color 3) 3)

    (DifferentValues 1 2 3)

    (= (Animal 1) (Color 1))
    (< (Drink 1) (Color 1))
    (not (= (Color 2) 3))
    (= (Drink 3) 2)
    (< (Animal 3) (Animal 1))




))


(check-sat)
(get-value (
    ;Color
    (Color 1)
    (Color 2)
    (Color 3)
    ;Animal
    (Animal 1)
    (Animal 2)
    (Animal 3)
    ;Drink
    (Drink 1)
    (Drink 2)
    (Drink 3)

))