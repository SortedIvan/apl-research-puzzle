;1 Dog
;2 Cat
;3 Mouse
(declare-const Dogs  Int)
(declare-const Cats Int)
(declare-const Mice Int)
(declare-const Budget Int)

(assert (and
    
    (= (+ Dogs Cats Mice) 100)
    (< 0 Dogs)
    (< 0 Cats)
    (< 0 Mice)
    (= (+ (* Dogs 60) (* Cats 4) (* Mice 1)) 400)

))

(check-sat)
(get-value (

    Dogs
    Cats
    Mice

))