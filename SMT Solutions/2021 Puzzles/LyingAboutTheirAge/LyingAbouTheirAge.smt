(declare-const Alex Int)
(declare-const Brook Int)
(declare-const Cody Int)
(declare-const Dusty Int)
(declare-const Erin Int)

(define-fun AbsValue ((x Int)) Int
    (ite (<= 0 x) x (- x))
)

(assert (and
;1

    (< 0 Alex)
    (< 0 Brook)
    (< 0 Cody)
    (< 0 Dusty)
    (< 0 Erin)

    (xor
        (and 
            (< Dusty Brook)
            (= Dusty (+ Erin 9))
        )
        (and
            (> Dusty Brook)
            (not (= Dusty (+ Erin 9)))
        )
    )
    
;2
    (xor
        (and
            (< Erin Brook)
            (= Erin (+ Alex 7))
        )
        (and
            (> Erin Brook)
            (not (= Erin (+ Alex 7)))
        )
    )
    
;3

    (xor
        (and
            (< Alex Brook)
            (= Brook (+ (* Alex 0.7) Alex))
        )
        (and
            (> Alex Brook)
            (not (= Brook (+ (* Alex 0.7) Alex)))
        )
    )

;4 
    (xor
        (and
            (< Brook Cody)
            (< Erin Cody)
        )    
        (and
            (> Brook Cody)
            (> Erin Cody)
        )
    )

;5
    (xor
        (and
            (< Cody Dusty)
            (or
                (= (- Cody Dusty) 6)
                (= (- Dusty Cody) 6)
            )
        )
        (and
            (> Cody Dusty)
            (or
                (not (= (- Cody Dusty) 6))
                (not (= (- Dusty Cody) 6))
            )
        )
    )

;6
    (xor
        (and
            (< Cody Alex)
            (= Cody (+ Alex 10))
        )    
        (and
            (> Cody Alex)
            (not (= Cody (+ Alex 10)))
        )
    )

;7
    (xor
        (and
            (< Cody Alex)
            (< Brook Dusty)
        )    
        (and
            (> Cody Alex)
            (not (< Brook Dusty))
        )
    )

;8
    (xor
        (and
            (< Brook Cody)
            (= (AbsValue (- Cody Dusty)) (AbsValue (- Dusty Erin)))
        )    
        (and
            (> Brook Cody)
            (not (= (AbsValue (- Cody Dusty)) (AbsValue (- Dusty Erin))))
        )
    )


))

(check-sat)
(get-value (
    ;Alex
    Alex
    ;Brook
    Brook
    ;Cody
    Cody
    ;Dusty
    Dusty
    ;Erin
    Erin
))