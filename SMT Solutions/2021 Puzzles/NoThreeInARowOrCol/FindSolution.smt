(declare-fun grid (Int Int) Int)



(assert (and

    (forall ((row Int) (col Int))
      (=>
        (and
          (<= 1 row 3)
          (<= 1 col 3)
        )
        (and
          (<= 1 (grid row col) 2)
        )
      )
    )
    

    (forall ((row Int))
      (=>
          (<= 1 row 3)
          (= (grid row 1) (grid row 2))
          (not (= (grid row 2) (grid row 3)))
          (not (= (grid row 1) (grid row 3)))
      )
    )

    (forall ((col Int))
      (=>
          (<= 1 col 3)
          (= (grid 1 col) (grid 2 col))
          (not (= (grid 2 col) (grid 3 col)))
          (not (= (grid 1 col) (grid 3 col)))
      )
    )

    
))

(check-sat)
(get-value(
   (grid 1 1)
   (grid 1 2)
   (grid 1 3)

   (grid 2 1)
   (grid 2 2)
   (grid 2 3)

   (grid 3 1)
   (grid 3 2)
   (grid 3 3)
))