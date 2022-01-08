
; Position of queen nr i is i (Q i)
(declare-fun Q (Int) Int)

(define-fun DiffDiag ((x1 Int) (y1 Int) (x2 Int) (y2 Int)) Bool
	(and
		(distinct (- y1 y2) (- x1 x2))
		(distinct (- y1 y2) (- x2 x1))
	)
)

(assert (and

; Every queen has a position on the 8x8 board:
(forall ((i Int))
	(implies
		(<= 1 i 8)
		(<= 1 (Q i) 8)
	)
)

; No queen in the same row:
(distinct (Q 1) (Q 2) (Q 3) (Q 4) (Q 5) (Q 6) (Q 7) (Q 8))

; No two queens on the same diagonal:

(forall ((i Int) (j Int))
	(implies
		(and
			(<= 1 i 8)
			(<= 1 j 8)
			(distinct i j)
		)
		(DiffDiag i (Q i) j (Q j))
	)
)

))

(check-sat)
(get-value (
 (Q 1)
 (Q 2)
 (Q 3)
 (Q 4)
 (Q 5)
 (Q 6)
 (Q 7)
 (Q 8)
))

