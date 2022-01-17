(declare-fun grid (Int Int) Int)
(declare-fun sumRow (Int) Int)
(declare-fun sumCol (Int) Int)


(define-fun SUMROW((row Int)) Int
   (+
     (grid row 1)
     (grid row 2)
     (grid row 3)
   )
)

(define-fun SUMCOL((col Int)) Int
   (+
     (grid 1 col)
     (grid 2 col)
     (grid 3 col)
   )
)


(assert (and
      (= (grid 1 1) 1)
      (= (grid 1 2) 1)
      (= (grid 1 3) 2)

      (= (grid 2 1) 2)
      (= (grid 2 2) 2)
      (= (grid 2 3) 1)

      (= (grid 3 1) 1)
      (= (grid 3 2) 1)
      (= (grid 3 3) 1)

      (forall ((row Int) (col Int))
        (=>
            (and
              (<= 1 row 3)
              (<= 1 col 3)
            )
            (and
              (= (sumRow row) (SUMROW row))
              (= (sumCol col) (SUMCOL col))
            )
        )
      )

      (forall ((c Int))
        (=>
            (and
              (<= 1 c 3)
            )
            (and
               (not (= (sumRow c) 3))
               (not (= (sumRow c) 6))
               (not (= (sumCol c) 3))
               (not (= (sumCol c) 6))
            )
            
        )
      )
     

    
))

(check-sat)
(get-value(
   (sumRow 1)
   (sumRow 2)
   (sumRow 3)
   
   (sumCol 1)
   (sumCol 2)
   (sumCol 3)
))