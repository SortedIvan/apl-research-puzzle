(declare-const Alex Int)
(declare-const Brook Int)
(declare-const Cody Int)
(declare-const Dusty Int)
(declare-const Erin Int)

; Fucntion for absolute value
(define-fun abs ((x Int)) Int
    (ite (> x 0) x (- 0 x))
)
; checks if the person speaking the thruth bases on who speaks to who
(define-fun truthsInverter ((name1 Int) (name2 Int) (statement Bool)) Bool
    (ite (<= name1 name2) statement (not statement))
)

(assert 
    (and
        ; statements from the problem  
        (truthsInverter Dusty Brook (= (+ Erin 9) Dusty))
        (truthsInverter Erin Brook (= (+ Alex 7) Erin))
        (truthsInverter Alex Brook (= (* Alex 1.7) Brook))
        (truthsInverter Brook Cody (< Erin Cody))
        (truthsInverter Cody Dusty (or (= (+ Dusty 6) Cody ) (= (- Dusty 6) Cody )))
        (truthsInverter Cody Alex (= (+ Alex 10) Cody))
        (truthsInverter Cody Alex (< Brook Dusty))
        (truthsInverter Brook Cody (= (abs (- Cody Dusty)) (abs (- Dusty Erin)))) 
        
        ; minimum age constaints
        (> Alex 0)
        (> Brook 0)
        (> Cody 0)
        (> Erin 0)
        (> Dusty 0)         
    )
)

(check-sat)
(get-model)
(exit)