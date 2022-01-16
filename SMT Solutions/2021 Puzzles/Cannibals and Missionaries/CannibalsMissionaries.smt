(declare-fun Missionaries (Int Int) Int)
(declare-fun Cannibals (Int Int) Int)

; boat (step) => Location of boat at given step 
;1 = Left beach 'origin', 0 = Right beach 'destination'
(declare-fun boat (Int) Int)
(declare-const EndStep Int)



(define-fun move ((step Int)) Bool
    (ite (= (boat step) 1)
        ; Then case (If boat is on the left beach 'origin')
        (and
            ;pick one of these possible actions
            (xor
                ;two Cannibals
                (and
                    (= (Missionaries 2 (+ step 1)) (Missionaries 2 step))
                    (= (Missionaries 1 (+ step 1)) (Missionaries 1 step))

                    (= (Cannibals 1 (+ step 1)) (- (Cannibals 1 step) 2))
                    (= (Cannibals 2 (+ step 1)) (+ (Cannibals 2 step) 2))


                    (= (boat (+ step 1)) 0)
                )
                ; two Missionaries   
                (and
                    (= (Cannibals 2 (+ step 1)) (Cannibals 2 step))
                    (= (Cannibals 1 (+ step 1)) (Cannibals 1 step))

                    (= (Missionaries 1 (+ step 1)) (- (Missionaries 1 step) 2))
                    (= (Missionaries 2 (+ step 1)) (+ (Missionaries 2 step) 2))


                    (= (boat (+ step 1)) 0)
                )
                ; one Cannibal
                (and                  
                    (= (Missionaries 2 (+ step 1)) (Missionaries 2 step))
                    (= (Missionaries 1 (+ step 1)) (Missionaries 1 step))
                    
                    (= (Cannibals 1 (+ step 1)) (- (Cannibals 1 step) 1))
                    (= (Cannibals 2 (+ step 1)) (+ (Cannibals 2 step) 1))


                    (= (boat (+ step 1)) 0)
                )
                ; one Missionarie
                (and
                    (= (Cannibals 2 (+ step 1)) (Cannibals 2 step))
                    (= (Cannibals 1 (+ step 1)) (Cannibals 1 step))

                    (= (Missionaries 1 (+ step 1)) (- (Missionaries 1 step) 1))
                    (= (Missionaries 2 (+ step 1)) (+ (Missionaries 2 step) 1))


                    (= (boat (+ step 1)) 0)
                )
                ;one Cannibal and one Missionarie
                (and
                    (= (Missionaries 1 (+ step 1)) (- (Missionaries 1 step) 1))
                    (= (Missionaries 2 (+ step 1)) (+ (Missionaries 2 step) 1))

                    (= (Cannibals 1 (+ step 1)) (- (Cannibals 1 step) 1))
                    (= (Cannibals 2 (+ step 1)) (+ (Cannibals 2 step) 1))

                     
                    (= (boat (+ step 1)) 0)
                )
            )

        )
        ; Else case (If boat is on the left beach 'destination')
        (and
          ;pick one of these possible actions 
            (xor
                ;two Cannibals
                (and
                    (= (Missionaries 2 (+ step 1)) (Missionaries 2 step))
                    (= (Missionaries 1 (+ step 1)) (Missionaries 1 step))

                    (= (Cannibals 2 (+ step 1)) (- (Cannibals 2 step) 2))
                    (= (Cannibals 1 (+ step 1)) (+ (Cannibals 1 step) 2))


                    (= (boat (+ step 1)) 1)
                )
                ; two Missionaries   
                (and  
                    (= (Cannibals 2 (+ step 1)) (Cannibals 2 step))
                    (= (Cannibals 1 (+ step 1)) (Cannibals 1 step))

                    (= (Missionaries 2 (+ step 1)) (- (Missionaries 2 step) 2))
                    (= (Missionaries 1 (+ step 1)) (+ (Missionaries 1 step) 2))



                    (= (boat (+ step 1)) 1)
                )
                ; one Cannibal
                (and
                    (= (Missionaries 2 (+ step 1)) (Missionaries 2 step))
                    (= (Missionaries 1 (+ step 1)) (Missionaries 1 step))

                    (= (Cannibals 2 (+ step 1)) (- (Cannibals 2 step) 1))
                    (= (Cannibals 1 (+ step 1)) (+ (Cannibals 1 step) 1))


                    (= (boat (+ step 1)) 1)
                )
                ; one Missionarie
                (and  
                    (= (Cannibals 2 (+ step 1)) (Cannibals 2 step))
                    (= (Cannibals 1 (+ step 1)) (Cannibals 1 step))

                    (= (Missionaries 2 (+ step 1)) (- (Missionaries 2 step) 1))
                    (= (Missionaries 1 (+ step 1)) (+ (Missionaries 1 step) 1))



                    (= (boat (+ step 1)) 1)
                )
                ;one Cannibal and one Missionarie
                (and
                    (= (Missionaries 2 (+ step 1)) (- (Missionaries 2 step) 1))
                    (= (Missionaries 1 (+ step 1)) (+ (Missionaries 1 step) 1))

                    (= (Cannibals 2 (+ step 1)) (- (Cannibals 2 step) 1))
                    (= (Cannibals 1 (+ step 1)) (+ (Cannibals 1 step) 1))


                    (= (boat (+ step 1)) 1)
                )
            )
        )
    )
)

;Total missionaries and cannibals values are constant
(define-fun total ((step Int)) Int
    (+
        (Missionaries 1 step)
        (Missionaries 2 step)
        (Cannibals 1 step)
        (Cannibals 2 step)
    )
)

(assert(and
        ;initial state
        (= (Cannibals 1 0) 3)
        (= (Missionaries 1 0) 3)
        (= (Cannibals 2 0) 0)
        (= (Missionaries 2 0) 0)
        (= (boat 0) 1)
         
         ; the values of each side 
         (forall((step Int))
            (=>
                (and
                  (<= 0 step EndStep)
                )
                (and
                
                    (<= 0 (Missionaries 1 step) 3)
                    (<= 0 (Missionaries 2 step) 3)
                    (<= 0 (Cannibals 1 step) 3)
                    (<= 0 (Cannibals 2 step) 3)
                    (<= 0 (boat step) 1)
                    (= (total step) (total (+ step 1))) ;Total values combined remain constant
                )                
            )
         )
            

        (forall ((step Int))
          (=>
            (and
                (<= 0 step EndStep) 
            )
            (and
                ; pick on of these possible actions:
                (xor
                    (and
                        (or
                            ; If the missionaries are bigger than the cannibals on the right side, then the missionaries on the left side should be 0
                            (and
                                (< (Cannibals 2 (+ step 1)) (Missionaries 2 (+ step 1)))
                                (= (Missionaries 1 (+ step 1)) 0)
                            )
                            ; same logic applies here 
                            (and
                                (< (Cannibals 1 (+ step 1)) (Missionaries 1 (+ step 1)))
                                (= (Missionaries 2 (+ step 1)) 0)
                            )
                        )
                    )
                    (and
                        (= (Cannibals 1 (+ step 1)) (Missionaries 1 (+ step 1)))
                        (= (Cannibals 2 (+ step 1)) (Missionaries 2 (+ step 1)))
                    )
                )
               (move step)
            )
          )
        )

        ; final result
        (= (Cannibals 1 EndStep) 0)
        (= (Missionaries 1 EndStep) 0)
        (= (Cannibals 2 EndStep) 3)
        (= (Missionaries 2 EndStep) 3)

        ; How many steps are needed to solve it
        (<= 0 EndStep 11)
    )
            

)


(check-sat)
(get-value(
    ;step 0
   (Missionaries 1 0)
   (Cannibals 1 0)
   (Missionaries 2 0)
   (Cannibals 2 0)
   (boat 0)
   ;step1
   (Missionaries 1 1)
   (Cannibals 1 1)
   (Missionaries 2 1)
   (Cannibals 2 1)
   (boat 1)
   ;step 2
   (Missionaries 1 2)
   (Cannibals 1 2)
   (Missionaries 2 2)
   (Cannibals 2 2)
   (boat 2)
   ;step 3
   (Missionaries 1 3)
   (Cannibals 1 3)
   (Missionaries 2 3)
   (Cannibals 2 3)
   (boat 3)
   ;step 4
   (Missionaries 1 4)
   (Cannibals 1 4)
   (Missionaries 2 4)
   (Cannibals 2 4)
   (boat 4)
   ;step 5
   (Missionaries 1 5)
   (Cannibals 1 5)
   (Missionaries 2 5)
   (Cannibals 2 5)
   (boat 5)
   ;step 6
   (Missionaries 1 6)
   (Cannibals 1 6)
   (Missionaries 2 6)
   (Cannibals 2 6)
   (boat 6)
   ;step 7
   (Missionaries 1 7)
   (Cannibals 1 7)
   (Missionaries 2 7)
   (Cannibals 2 7)
   (boat 7)
   ;step 8
   (Missionaries 1 8)
   (Cannibals 1 8)
   (Missionaries 2 8)
   (Cannibals 2 8)
   (boat 8)
   ;step 9
   (Missionaries 1 9)
   (Cannibals 1 9)
   (Missionaries 2 9)
   (Cannibals 2 9)
   (boat 9)
   ;step 10
   (Missionaries 1 10)
   (Cannibals 1 10)
   (Missionaries 2 10)
   (Cannibals 2 10)
   (boat 10)
   ;step 11
   (Missionaries 1 11)
   (Cannibals 1 11)
   (Missionaries 2 11)
   (Cannibals 2 11)
   (boat 11)
   ;step 12
   (Missionaries 1 12)
   (Cannibals 1 12)
   (Missionaries 2 12)
   (Cannibals 2 12)
   (boat 12)

))