(declare-fun C (Int Int) Bool)

(define-fun OneRookPerCol ((c Int)) Bool
    (= (+
            (ite (C c 1) 1 0)
            (ite (C c 2) 1 0)
            (ite (C c 3) 1 0)
            (ite (C c 4) 1 0)
            (ite (C c 5) 1 0)

        )
    1)
)

(define-fun OneRookPerRow ((r Int)) Bool
    (= (+
            (ite (C 1 r) 1 0)
            (ite (C 2 r) 1 0)
            (ite (C 3 r) 1 0)
            (ite (C 4 r) 1 0)
            (ite (C 5 r) 1 0)

        )
    1)
)

(assert (and

    (forall ((col Int))
        (implies 
            (and  
                (<= 1 col 5)               
            )
            (OneRookPerCol col)
        )
    )
        (forall ((row Int))
        (implies 
            (and  
                (<= 1 row 5)                
            )
            (OneRookPerRow row)
        )
    )

))


(check-sat)
(get-value (
    ;C1
    (C 1 1)
    (C 1 2)
    (C 1 3)
    (C 1 4)
    (C 1 5)

    ;C2
    (C 2 1)
    (C 2 2)
    (C 2 3)
    (C 2 4)
    (C 2 5)

    ;C3
    (C 3 1)
    (C 3 2)
    (C 3 3)
    (C 3 4)
    (C 3 5)

    ;C4
    (C 4 1)
    (C 4 2)
    (C 4 3)
    (C 4 4)
    (C 4 5)

    ;C5
    (C 5 1)
    (C 5 2)
    (C 5 3)
    (C 5 4)
    (C 5 5)


))