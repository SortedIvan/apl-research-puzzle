
; WATER-POURING puzzle

; (time, jug) -> contents
(declare-fun C (Int Int) Int)

; jug -> maximum contents
;  [will be completely specified for all jugs, see below]
;  [could have been made a defined function, but this way, it works as well.]
(declare-fun Capacity (Int) Int)

; timepoint at which the required end-state is reached
(declare-const N Int)

; total amount of water
(define-fun Total((t Int)) Int
	(+
		(C t 1)
		(C t 2)
		(C t 3)
	)
)

(assert (and

; fully specified, the Capacity function for all jugs:
(= (Capacity 1) 8)
(= (Capacity 2) 5)
(= (Capacity 3) 3)

; begin-state:
(= (C 0 1) 8)
(= (C 0 2) 0)
(= (C 0 3) 0)

; wanted end-state:
(= (C N 1) 4)
(= (C N 2) 4)
(= (C N 3) 0)


; constraints:

;the contents of a jug is never negative, and at most the capacity of the jug
(forall ((t Int)(j Int))
	(implies (<= 0 t N)
		(<= 0 (C t j) (Capacity j))
	)
)

;total amount of water remains constant
(forall ((t Int))
	(implies (<= 0 t)
		(= (Total t)(Total (+ t 1)))
	)
)

;on each step, one jug remains unaltered, one of the others becomes either full or empty
(forall ((t Int))
	(implies 
		(<= 0 t N)  ; restriction to a finite situation is necessary, because of the 'exists' clause below
		(exists ((j1 Int) (j2 Int) (j3 Int))    ; this way you don't have to work with a 'or' and all combinations explicitly written down...
			(and
				(distinct j1 j2 j3)
				(<= 1 j1 3)
				(<= 1 j2 3)
				(<= 1 j3 3)

				(= (C t j1)(C (+ t 1) j1))  ; one jug remains empty
				(distinct (C t j2)(C (+ t 1) j2))  ; the other two jugs change contents
				(distinct (C t j3)(C (+ t 1) j3))

				(or		; of these jugs, one becomes empty, or the other becomes full
					(= (C (+ t 1) j2) 0)
					(= (C (+ t 1) j3) (Capacity j3))
				)
			)
		)
	)
) 

;restrict the search to at most 10 steps
(<= 0 N 10)

))
(check-sat)
(get-value (
   N
  (C 0 1)
  (C 0 2)
  (C 0 3)

  (C 1 1)
  (C 1 2)
  (C 1 3)
 
  (C 2 1)
  (C 2 2)
  (C 2 3)

  (C 3 1)
  (C 3 2)
  (C 3 3)

  (C 4 1)
  (C 4 2)
  (C 4 3)

  (C 5 1)
  (C 5 2)
  (C 5 3)

  (C 6 1)
  (C 6 2)
  (C 6 3)

  (C 7 1)
  (C 7 2)
  (C 7 3)

  (C 8 1)
  (C 8 2)
  (C 8 3)

  (C 9 1)
  (C 9 2)
  (C 9 3)

  (C 10 1)
  (C 10 2)
  (C 10 3)

))
