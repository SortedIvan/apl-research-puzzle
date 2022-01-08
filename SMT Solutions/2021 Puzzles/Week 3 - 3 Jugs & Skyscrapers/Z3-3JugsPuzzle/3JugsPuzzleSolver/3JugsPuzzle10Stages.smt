(declare-fun Jug (Int Int) Int)
;The possible stages that the puzzle can be solved.
;can be adjusted by changing it
(declare-const PossibleStagesToSolve Int)

;The sum of each jug per each stage is equal to 8
(define-fun WaterContentPerStage ((stage Int)) Bool
    (and 
        (= (+ (Jug 1 stage) (Jug 2 stage) (Jug 3 stage)) 8)
    )

)

;Defines the maximum capacity for each jug
(define-fun MaxValueForJug ((stage Int)) Bool
    (and 
        (<= 0 (Jug 1 stage) 8)
        (<= 0 (Jug 2 stage) 5)
        (<= 0 (Jug 3 stage) 3)
    )
)

;Makes the jugs at each stage have values between 8 and 0
(define-fun ApplyMaxValue () Bool
    (and (MaxValueForJug 1) (MaxValueForJug 2)
         (MaxValueForJug 3) (MaxValueForJug 4)
         (MaxValueForJug 5) (MaxValueForJug 6)
         (MaxValueForJug 7) (MaxValueForJug 8)
    ) 
)

(assert
    (and
        ;1) Assigns the initial values of each jug and the possible stages it takes to find an answer
        (= (Jug 1 1) 8)
        (= (Jug 2 1) 0)
        (= (Jug 3 1) 0)
        (= PossibleStagesToSolve 10)

        ;2) Makes sure that the values do not exceed the limit
        ApplyMaxValue

        ;3) No two stages are repeated
        (not     
            (exists ((stage1 Int) (stage2 Int))
                (and 
                    (<= 1 stage1 PossibleStagesToSolve)
                    (<= 1 stage2 PossibleStagesToSolve)
                    (distinct stage1 stage2)
                    (and 
                        (= (Jug 1 stage1) (Jug 1 stage2))
                        (= (Jug 2 stage1) (Jug 2 stage2))
                        (= (Jug 3 stage1) (Jug 3 stage2))
                    )
                )
            )
        )

        ;4) There exists a stage between 1 and 8 that has the values 4 4 0
        (exists ((stage Int))
            (and
                (<= 1 stage PossibleStagesToSolve)
                (and 
                (= (Jug 1 stage) 4)
                (= (Jug 2 stage) 4)
                (= (Jug 3 stage) 0)    
                )

            )
        ) 

        ;5) For all stages, the water content between the jugs combined is 8
        (forall ((stage Int))
          (implies 
            (and  
                (<= 1 stage PossibleStagesToSolve)  
            )
            (WaterContentPerStage stage)
          )
        )

        ;6) It makes sure only 2 values change per stage, 3rd remains the same and
        ; either 1 jug becomes full and the other one empty, or the other way around
        (forall ((stage Int))
          (implies 
            (and  
                (<= 1 stage PossibleStagesToSolve)  
            )
            (and
                (or
                    ;jg1 and j2 change, j3 remains
                    (and 
                         (= (Jug 3 (+ stage 1)) (Jug 3 stage))
                         (= (+ (Jug 1 (+ stage 1)) (Jug 2 (+ stage 1))) (+ (Jug 1 stage) (Jug 2 stage)))
                            (or
                                (= (Jug 1 (+ stage 1)) 0)
                                (= (Jug 2 (+ stage 1)) 5)
                                (= (Jug 2 (+ stage 1)) 0)
                                (= (Jug 1 (+ stage 1)) 8)
                            )
                    )
                    ;jg1 and jg3 change, j2 remains
                    (and 
                         (= (Jug 2 (+ stage 1)) (Jug 2 stage))
                         (= (+ (Jug 1 (+ stage 1)) (Jug 3 (+ stage 1))) (+ (Jug 1 stage) (Jug 3 stage)))
                         (or
                                (= (Jug 1 (+ stage 1)) 0)
                                (= (Jug 3 (+ stage 1)) 3)
                                (= (Jug 3 (+ stage 1)) 0)
                                (= (Jug 1 (+ stage 1)) 8)
                         
                         )
                    )
                    ;j2 and j3 change, j1 remains
                    (and 
                         (= (Jug 1 (+ stage 1)) (Jug 1 stage))
                         (= (+ (Jug 2 (+ stage 1)) (Jug 3 (+ stage 1))) (+ (Jug 2 stage) (Jug 3 stage)))
                        (or
                                (= (Jug 3 (+ stage 1)) 0)
                                (= (Jug 2 (+ stage 1)) 5)
                                (= (Jug 2 (+ stage 1)) 0)
                                (= (Jug 3 (+ stage 1)) 3)
                        
                        )
                    )
                )
            )
          )
        )

    )
)

(echo "The values for Jug 1, Jug 2 and Jug 3:")
(check-sat)
(get-value (
    (Jug 1 1)
    (Jug 2 1)
    (Jug 3 1)

    (Jug 1 2)
    (Jug 2 2)
    (Jug 3 2)

    (Jug 1 3)
    (Jug 2 3)
    (Jug 3 3)

    (Jug 1 4)
    (Jug 2 4)
    (Jug 3 4)

    (Jug 1 5)
    (Jug 2 5)
    (Jug 3 5)

    (Jug 1 6)
    (Jug 2 6)
    (Jug 3 6)

    (Jug 1 7)
    (Jug 2 7)
    (Jug 3 7)

    (Jug 1 8)
    (Jug 2 8)
    (Jug 3 8)

    (Jug 1 9)
    (Jug 2 9)
    (Jug 3 9)

    (Jug 1 10)
    (Jug 2 10)
    (Jug 3 10)

))