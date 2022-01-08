(declare-const A Int)
(declare-const F Int)
(declare-const T Int)
(declare-const E Int)
(declare-const R Int)
(declare-const O Int)
(declare-const W Int)
(declare-const Y Int)
(declare-const S Int)


;AFTER + TWO = YEARS

(assert 
    (and
        
        (= 
            (+ S (* R 10) (* A 100) (* E 1000) (* Y 10000))
            (+             
                (+ R (* E 10) (* T 100) (* F 1000) (* A 10000))
                (+ O (* W 10) (* T 100))
            )

        )

        (distinct A F T E R O W Y S )

        (>= A 0)
        (>= F 0)
        (>= T 0)
        (>= E 0)
        (>= R 0)
        (>= O 0)
        (>= W 0)
        (>= Y 0)
        (>= S 0)

        (<= A 9)
        (<= F 9)
        (<= T 9)
        (<= E 9)
        (<= R 9)
        (<= O 9)
        (<= W 9)
        (<= Y 9)
        (<= S 9)

    )
)



(check-sat)
(get-model)
(exit)