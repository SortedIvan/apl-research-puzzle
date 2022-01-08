;variables a and b
(declare-fun a (Int) Int)
(declare-fun b (Int) Int)

;iteration of the fir loop
(define-fun step ((timestep Int)) Bool
    (ite
        (> (a (- timestep 1)) (b (- timestep 1)))
        ;Then
        (and 
            (= (b timestep) (* (b (- timestep 1)) 2)) 
            (= (a timestep) (- (a (- timestep 1)) 3))
        )
        ;Else
        (and 
            (= (a timestep) (* (a (- timestep 1)) 2)) 
            (= (b timestep) (- (b (- timestep 1)) 5))
        )
    )
)

(assert
    (and
        ; values of hte end of the loop
        (= (a 10) 1000)
        (= (b 10) 999)

        ; for loops
        (step 1)
        (step 2)
        (step 3)
        (step 4)
        (step 5)
        (step 6)
        (step 7)
        (step 8)
        (step 9)
        (step 10)
    )
)
(echo "initial values for a and b:")
(check-sat)
(get-value ((a 0) (b 0)))
(exit)