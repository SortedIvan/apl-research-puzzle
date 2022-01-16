(declare-fun Sum (Int) Int)
(declare-fun ChosenNr (Int) Int)
(declare-const EndStep Int)
(declare-const S Int)


;A function that allows the check of whether a number is prime or not
(define-fun IsPrime ((value Int)) Bool

    (and 
        (> value 0) (not (exists ((y Int) (x Int)) (and (= value (* x y)) (< x value) (< y value)  (> x 1) (> y 1)))) 
    )

)

;Add sum holds all of the possible ways Z3 can iterate within the 7 distinct "circles"/numbers
(define-fun AddSum ((step Int)) Bool
    (or
        (and 
            (= (ChosenNr step) 3)
            (or
                (= (ChosenNr (+ step 1)) 4) (= (ChosenNr (+ step 1)) 2) (= (ChosenNr (+ step 1)) 20)
            )
            (= (Sum (+ step 1)) (+ (Sum step) (ChosenNr (+ step 1))))
        )
        (and 
            (= (ChosenNr step) 4)
            (or
                (= (ChosenNr (+ step 1)) 8) (= (ChosenNr (+ step 1)) 2) (= (ChosenNr (+ step 1)) 3)
            )
            (= (Sum (+ step 1)) (+ (Sum step) (ChosenNr (+ step 1))))
        )
        (and 
            (= (ChosenNr step) 8)
            (or
                (= (ChosenNr (+ step 1)) 4) (= (ChosenNr (+ step 1)) 2) (= (ChosenNr (+ step 1)) 10)
            )
            (= (Sum (+ step 1)) (+ (Sum step) (ChosenNr (+ step 1))))
        )
        (and 
            (= (ChosenNr step) 10)
            (or
                (= (ChosenNr (+ step 1)) 8) (= (ChosenNr (+ step 1)) 2) (= (ChosenNr (+ step 1)) 6)
            )
            (= (Sum (+ step 1)) (+ (Sum step) (ChosenNr (+ step 1))))
        )
        (and 
            (= (ChosenNr step) 6)
            (or
                (= (ChosenNr (+ step 1)) 10) (= (ChosenNr (+ step 1)) 2) (= (ChosenNr (+ step 1)) 20)
            )
            (= (Sum (+ step 1)) (+ (Sum step) (ChosenNr (+ step 1))))
            
        )
        (and 
            (= (ChosenNr step) 20)
            (or
                (= (ChosenNr (+ step 1)) 3) (= (ChosenNr (+ step 1)) 2) (= (ChosenNr (+ step 1)) 6)
            )
            (= (Sum (+ step 1)) (+ (Sum step) (ChosenNr (+ step 1))))
        )
        (and 
            (= (ChosenNr step) 2)
            (or
                (= (ChosenNr (+ step 1)) 3) (= (ChosenNr (+ step 1)) 4) (= (ChosenNr (+ step 1)) 8)
                (= (ChosenNr (+ step 1)) 10) (= (ChosenNr (+ step 1)) 6) (= (ChosenNr (+ step 1)) 20)
            )
            (= (Sum (+ step 1)) (+ (Sum step) (ChosenNr (+ step 1))))
        )
    )
)


(assert (and

    ;SUM AT STEP 0 is 3 
    (= (Sum 0) 3)
    ;NUMBER CHOSEN AT STEP 0 (number is defined by 2)
    (= (ChosenNr 0) 3)

    ;The sum at end step is 79
    (= (Sum EndStep) 79)
    ;The last chosen number is 20
    (= (ChosenNr EndStep) 20)


    ;Ping ponging between values is not allowed
    (forall ((step Int))
        (implies 
            (and  
                (<= 0 step EndStep)  
            )
            (distinct (ChosenNr step) (ChosenNr (+ step 2)))
        )
    ) 

    (forall ((step Int))
        (implies 
            (and  
                (<= 0 step EndStep)  
            )
            (AddSum step)
        )
    )    

   

    ;FOR ALL STEPS THE SUM SHOULD BE PRIME!!!
    (forall ((step Int))
        (implies 
            (and  
                (<= 1 step EndStep)  
            )
            (IsPrime (Sum step))
        )
    )

    (= EndStep 11)
))

(check-sat)
(get-value (
    ;Sum
    (Sum 0)
    (Sum 1)
    (Sum 2)
    (Sum 3)
    (Sum 4)
    (Sum 5)
    (Sum 6)
    (Sum 7)
    (Sum 8)
    (Sum 9)
    (Sum 10)
    (Sum 11)


    ;ChosenNr
    (ChosenNr 0)
    (ChosenNr 1)
    (ChosenNr 2)
    (ChosenNr 3)
    (ChosenNr 4)
    (ChosenNr 5)
    (ChosenNr 6)
    (ChosenNr 7)
    (ChosenNr 8)
    (ChosenNr 9)
    (ChosenNr 10)
    (ChosenNr 11)


))