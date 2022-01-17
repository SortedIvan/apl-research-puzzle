(declare-fun Auction (Int) Int)
(declare-fun Q1 (Int) Bool)
(declare-fun Q2 (Int) Bool)
(declare-fun Q3 (Int) Bool)
;1 harmonica
;2 lamp
;3 mirror
;4 sundial
;5 table
;6 vase

(define-fun AnswerQuestion ((question Int)) Bool
    (or
        (and 
            (= question 1)
            ;Q1
            (xor
                (and
                    (= (Auction 1) 1)
                    (= (Auction 4) 2)
                    (= (Auction 5) 3)
                    (= (Auction 3) 4)
                    (= (Auction 2) 5)
                    (= (Auction 6) 6)
                    (= (Q1 1) true) (= (Q1 2) false)
                )

                (and
                    (= (Auction 4) 1)
                    (= (Auction 2) 2)
                    (= (Auction 1) 3)
                    (= (Auction 3) 4)
                    (= (Auction 5) 5)
                    (= (Auction 6) 6)
                    (= (Q1 2) true) (= (Q1 1) false)
                )

            )
        )
        (and
            (= question 2)
            ;Q2
            (xor
                (and
                    (= (Auction 5) 2)
                    (= (Auction 2) 3)
                    (= (Q2 1) true) (= (Q2 2) false)
                )

                (and
                    (= (Auction 4) 2)
                    (= (Auction 6) 3)
                    (= (Q2 2) true) (= (Q2 1) false)

                )

            )               
        
        )
        (and
            (= question 3)
            ;q3
            (xor 
                (and (< (Auction 3) (Auction 6))  (= (Q3 1) true) (= (Q3 2) false))
                (and (< (Auction 4) (Auction 2))  (= (Q3 2) true) (= (Q3 1) false))
            
            )
            
        
        
        )
    )
)

(assert (and

    ;for all items, the days should be between 1 and 6
    (forall ((item Int))
        (=>
            
            (<= 1 item 6)
            (<= 1 (Auction item) 6)
            
        )
    )

    (distinct (Auction 1) (Auction 2) (Auction 3) (Auction 4) (Auction 5) (Auction 6))
    
    ;cond1 - Sundial is not on the first day
    (not (= (Auction 4) 1))

    ;condition 2
    (ite (< (Auction 1) (Auction 2)) (< (Auction 3) (Auction 2)) (> (Auction 3) (Auction 2)))

    ;condition 3
    (and
        (< (Auction 4) (Auction 3))
        (< (Auction 4) (Auction 6))
    )

    (xor
        (< (Auction 5) (Auction 1))
        (< (Auction 5) (Auction 6))
    )

    
    (AnswerQuestion 2)


))

(check-sat)
(get-value (
    (Auction 1)
    (Auction 2)
    (Auction 3)
    (Auction 4)
    (Auction 5)
    (Auction 6)

    ;QUESTIONS
    ;Q1
    (Q1 1)
    (Q1 2)

    ;Q2
    (Q2 1)
    (Q2 2)

    ;Q3
    (Q3 1)
    (Q3 2)
))