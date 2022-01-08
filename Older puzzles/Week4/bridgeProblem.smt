(declare-fun Albert (Int) Int)
(declare-fun Bob (Int) Int)
(declare-fun Charlie (Int) Int)
(declare-fun Fred (Int) Int)
(declare-fun torchCarrier (Int) Int)

(declare-fun Minutes (Int) Int)

; Assumption Albert < Bob < Charlie < Fred (Speed)
(declare-const ASpeed Int)
(declare-const BSpeed Int)
(declare-const CSpeed Int)
(declare-const FSpeed Int)

; Possible actions:
; 1 = Left -> Right
; 0 = Right -> Left
(define-fun step ((timestep Int) (action Int)) Bool
    (xor
        ; Try to move only Albert
        (and
            (= (Albert timestep) action)
            (not (= (Albert (- timestep 1)) action)) ; This move is only viable if Albert moves from one side to another
            
            (= (Bob timestep) (Bob (- timestep 1)))
            (= (Charlie timestep) (Charlie (- timestep 1)))
            (= (Fred timestep) (Fred (- timestep 1)))
            
            (= (Minutes timestep) (+ (Minutes (- timestep 1)) ASpeed))
        )
        ; Try to move only Bob
        (and
            (= (Bob timestep) action)
            (not (= (Bob (- timestep 1)) action)) ; This move is only viable if Bob moves from one side to another
            
            (= (Albert timestep) (Albert (- timestep 1)))
            (= (Charlie timestep) (Charlie (- timestep 1)))
            (= (Fred timestep) (Fred (- timestep 1)))
            
            (= (Minutes timestep) (+ (Minutes (- timestep 1)) BSpeed))
        )
        ; Try to move only Charlie
        (and
            (= (Charlie timestep) action)
            (not (= (Charlie (- timestep 1)) action)) ; This move is only viable if Charlie moves from one side to another
            
            (= (Albert timestep) (Albert (- timestep 1)))
            (= (Bob timestep) (Bob (- timestep 1)))
            (= (Fred timestep) (Fred (- timestep 1)))
            
            (= (Minutes timestep) (+ (Minutes (- timestep 1)) CSpeed))
        )
        ; Try to move only Fred
        (and
            (= (Fred timestep) action)
            (not (= (Fred (- timestep 1)) action)) ; This move is only viable if Fred moves from one side to another
            
            (= (Albert timestep) (Albert (- timestep 1)))
            (= (Bob timestep) (Bob (- timestep 1)))
            (= (Charlie timestep) (Charlie (- timestep 1)))
            
            (= (Minutes timestep) (+ (Minutes (- timestep 1)) FSpeed))
        )
        
        ; Combinations Albert + (BCF)
        (and
            (= (Albert timestep) action)
            (not (= (Albert (- timestep 1)) action))
            (xor
                (and
                    (= (Bob timestep) action)
                    (not (= (Bob (- timestep 1)) action))

                    (= (Charlie timestep) (Charlie (- timestep 1)))
                    (= (Fred timestep) (Fred (- timestep 1)))

                    (= (Minutes timestep) (+ (Minutes (- timestep 1)) BSpeed))
                )
                (and
                    (= (Charlie timestep) action)
                    (not (= (Charlie (- timestep 1)) action))

                    (= (Bob timestep) (Bob (- timestep 1)))
                    (= (Fred timestep) (Fred (- timestep 1)))

                    (= (Minutes timestep) (+ (Minutes (- timestep 1)) CSpeed))
                )
                (and
                    (= (Fred timestep) action)
                    (not (= (Fred (- timestep 1)) action))

                    (= (Bob timestep) (Bob (- timestep 1)))
                    (= (Charlie timestep) (Charlie (- timestep 1)))
                    
                    (= (Minutes timestep) (+ (Minutes (- timestep 1)) FSpeed))
                )
            )
        )
        ; Combinations Bob + (ACF)
        (and
            (= (Bob timestep) action)
            (not (= (Bob (- timestep 1)) action))
            (xor
                (and
                    (= (Charlie timestep) action)
                    (not (= (Charlie (- timestep 1)) action))

                    (= (Albert timestep) (Albert (- timestep 1)))
                    (= (Fred timestep) (Fred (- timestep 1)))

                    (= (Minutes timestep) (+ (Minutes (- timestep 1)) CSpeed))
                )
                (and
                    (= (Fred timestep) action)
                    (not (= (Fred (- timestep 1)) action))

                    (= (Albert timestep) (Albert (- timestep 1)))
                    (= (Charlie timestep) (Charlie (- timestep 1)))
                    
                    (= (Minutes timestep) (+ (Minutes (- timestep 1)) FSpeed))
                )
            )
        )
        ; Combinations Charlie + (ABF)
        (and
            (= (Charlie timestep) action)
            (not (= (Charlie (- timestep 1)) action))
            (xor
                (and
                    (= (Fred timestep) action)
                    (not (= (Fred (- timestep 1)) action))

                    (= (Albert timestep) (Albert (- timestep 1)))
                    (= (Bob timestep) (Bob (- timestep 1)))
                    
                    (= (Minutes timestep) (+ (Minutes (- timestep 1)) FSpeed))
                )
            )
        )
    )
)

(define-fun movePeople ((timestep Int)) Bool
     (ite (= (torchCarrier timestep) 0)
        ; Then case (Torch carrier is on left side of bridge [origin])
        (and
            (step timestep 1)
            (= (torchCarrier (+ timestep 1)) 1)
        )
        ; Else case (Torch carrier is on right side of bridge [destination])
        (and
            (step timestep 0)
            (= (torchCarrier (+ timestep 1)) 0)
        )
     )
)

(assert
    (and
        ; Initializing speed values for each person (A < B < C < F)
        (= ASpeed 1)
        (= BSpeed 2)
        (= CSpeed 5)
        (= FSpeed 10)
        ; Initial values for all four people and location of torch carrier
        (= (Albert 0) 0)
        (= (Bob 0) 0)
        (= (Charlie 0) 0)
        (= (Fred 0) 0)
        (= (Minutes 0) 0)
        (= (torchCarrier 1) 0)


        (movePeople 1)
        (movePeople 2)
        (movePeople 3)
        (movePeople 4)
        (movePeople 5)

        ; Desired end state of all four people: Right side of bridge (1)
        (= (Albert 5) 1)
        (= (Bob 5) 1)
        (= (Charlie 5) 1)
        (= (Fred 5) 1)
    )
)
; optimization for the minutes
(minimize (Minutes 5))
(check-sat)
(get-model)
(exit)