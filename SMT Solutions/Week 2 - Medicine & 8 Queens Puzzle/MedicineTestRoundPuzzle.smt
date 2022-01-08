;M is the "Matrix" or positions of the medicines in the table
(declare-fun M (Int Int) Bool)
(declare-fun Pairs (Int Int) Int)
;array of rounds
(declare-fun Rounds (Int) Int)

;array of meds
(declare-fun Meds (Int) Int)

;We check if the cells of the array are 3
;Makes sure that only 3 cells exist per round
(define-fun ThreeRoundsPerMedicine ((r Int)) Bool
    (and  (= (Rounds r) (+
            (ite (M r 1) 1 0)
            (ite (M r 2) 1 0)
            (ite (M r 3) 1 0)
            (ite (M r 4) 1 0)
            (ite (M r 5) 1 0)
            (ite (M r 6) 1 0)
            (ite (M r 7) 1 0)

        )
    )
    (= (Rounds r) 3))
)

;Sets the position for all instances
(define-fun AllRounds() Bool
    (and 
        (ThreeRoundsPerMedicine 1)
        (ThreeRoundsPerMedicine 2)
        (ThreeRoundsPerMedicine 3)
        (ThreeRoundsPerMedicine 4)
        (ThreeRoundsPerMedicine 5)
        (ThreeRoundsPerMedicine 6)
        (ThreeRoundsPerMedicine 7)
    )
)

;Makes sure that the medicine is completed in exactly 3 rounds
;We check if the cells of the array are 3
(define-fun ThreeMedicinesPerRound ((r Int)) Bool
    (and (= (Meds r) (+
            (ite (M 1 r) 1 0)
            (ite (M 2 r) 1 0)
            (ite (M 3 r) 1 0)
            (ite (M 4 r) 1 0)
            (ite (M 5 r) 1 0)
            (ite (M 6 r) 1 0)
            (ite (M 7 r) 1 0)

        )
    )
    (= (Meds r) 3))
)

;Sets the position for all instances
(define-fun AllMeds() Bool
    (and 
        (ThreeMedicinesPerRound 1)
        (ThreeMedicinesPerRound 2)
        (ThreeMedicinesPerRound 3)
        (ThreeMedicinesPerRound 4)
        (ThreeMedicinesPerRound 5)
        (ThreeMedicinesPerRound 6)
        (ThreeMedicinesPerRound 7)
    )
)

; Based on the row and column, we make sure that no pair 
; of medicines can occur twice in the table
(define-fun NoMedPairsPerRound ((r Int) (c Int)) Bool
    (and (= (Pairs r c) (+
            (ite (and (M 1 r) (M 1 c)) 1 0) 
            (ite (and (M 2 r) (M 2 c)) 1 0)
            (ite (and (M 3 r) (M 3 c)) 1 0)
            (ite (and (M 4 r) (M 4 c)) 1 0)
            (ite (and (M 5 r) (M 5 c)) 1 0)
            (ite (and (M 6 r) (M 6 c)) 1 0)
            (ite (and (M 7 r) (M 7 c)) 1 0)
        )
    )
    (not (> (Pairs r c) 1)))
)

;Sets the position for all instances
(define-fun NoPairs() Bool
    (and 
        (NoMedPairsPerRound 1 2)
        (NoMedPairsPerRound 1 3)
        (NoMedPairsPerRound 1 4)
        (NoMedPairsPerRound 1 5)
        (NoMedPairsPerRound 1 6)
        (NoMedPairsPerRound 1 7)

        (NoMedPairsPerRound 2 3)
        (NoMedPairsPerRound 2 4)
        (NoMedPairsPerRound 2 5)
        (NoMedPairsPerRound 2 6)
        (NoMedPairsPerRound 2 7)

        (NoMedPairsPerRound 3 4)
        (NoMedPairsPerRound 3 5)
        (NoMedPairsPerRound 3 6)
        (NoMedPairsPerRound 3 7)

        (NoMedPairsPerRound 4 5)
        (NoMedPairsPerRound 4 6)
        (NoMedPairsPerRound 4 7)

        (NoMedPairsPerRound 5 6)
        (NoMedPairsPerRound 5 7)

        (NoMedPairsPerRound 6 7)
    )
)

;Sets the position for all instances
;Asserts the functions (calls the functions)
(assert (and
    AllRounds
    AllMeds
    NoPairs


))

(check-sat)
(get-model)