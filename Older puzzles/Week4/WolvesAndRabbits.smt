; animal (timestep) => Number of target animal at given timestep
(declare-fun wolves (Int) Int)
(declare-fun rabbits (Int) Int)

; boat (timestep) => Location of boat at given timestep (1 = Left shore[origin], 0 = Right shore[destination])
(declare-fun boat (Int) Int)

(define-fun step ((timestep Int)) Bool
    (ite (= (boat timestep) 1)
        ; Then case (If boat is on the left shore [origin])
        (and
            ; Pick one of five possible actions: {(1 wolf, 1 rabbit), (2 wolves), (2 rabbits), (1 wolf), (1 rabbit)}
            (xor
                ; If a state does not change for next timestep, copy the timestep from the previous move 
                (and
                    (<= (wolves (+ timestep 1)) (rabbits (+ timestep 1)))
                    (= (wolves (+ timestep 1)) (- (wolves timestep) 1))
                    (= (rabbits (+ timestep 1)) (- (rabbits timestep) 1))
                    (= (boat (+ timestep 1)) 0)
                )   
                (and
                    (<= (wolves (+ timestep 1)) (rabbits (+ timestep 1)))
                    (= (wolves (+ timestep 1)) (- (wolves timestep) 2))
                    (= (rabbits (+ timestep 1)) (rabbits timestep))
                    (= (boat (+ timestep 1)) 0)
                )
                (and
                    (<= (wolves (+ timestep 1)) (rabbits (+ timestep 1)))
                    (= (rabbits (+ timestep 1)) (- (rabbits timestep) 2))
                    (= (wolves (+ timestep 1)) (wolves timestep))
                    (= (boat (+ timestep 1)) 0)
                )
                (and
                    (<= (wolves (+ timestep 1)) (rabbits (+ timestep 1)))
                    (= (wolves (+ timestep 1)) (- (wolves timestep) 1))
                    (= (rabbits (+ timestep 1)) (rabbits timestep))
                    (= (boat (+ timestep 1)) 0)
                )
                (and
                    (<= (wolves (+ timestep 1)) (rabbits (+ timestep 1)))
                    (= (rabbits (+ timestep 1)) (- (rabbits timestep) 1))
                    (= (wolves (+ timestep 1)) (wolves timestep))
                    (= (boat (+ timestep 1)) 0)
                )
            )

            (<= (wolves (+ timestep 1)) 3)
            (>= (wolves (+ timestep 1)) 0)
            (<= (rabbits (+ timestep 1)) 3)
            (>= (rabbits (+ timestep 1)) 0)
        )
        ; Else case (If boat is on the right shore [destination])
        (and
            ; Wolves and rabbits stay in the same state as previous timestep. Boat moves to the other shore to pick up the other pack
            (= (wolves (+ timestep 1)) (wolves timestep))
            (= (rabbits (+ timestep 1)) (rabbits timestep))
            (= (boat (+ timestep 1)) 1)
        )
    )
)

(assert
    (and
        ; Initial count of wolves and rabbits. Initial location of boat
        (= (wolves 1) 3)
        (= (rabbits 1) 3)
        (= (boat 1) 1)

        ; Evaluating correct step for each move
        (step 1)
        (step 2)
        (step 3)
        (step 4)
        (step 5)

        ; Desired finish state for each animal and boat (all wolves, rabbits and boat are on the destination shore)
        (= (wolves 6) 0)
        (= (rabbits 6) 0)
        (= (boat 6) 0)
    )
)

(check-sat) 
(get-model)
(exit)