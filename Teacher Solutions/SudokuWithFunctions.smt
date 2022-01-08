; declare fields
(declare-fun B (Int Int) Int)

; all cells in one row 'row' are distinct
(define-fun UniquePerRow ((row Int)) Bool
	(distinct (B row 1)
			  (B row 2)
			  (B row 3)
			  (B row 4)
			  (B row 5)
			  (B row 6)
			  (B row 7)
			  (B row 8)
			  (B row 9)
	)
)
; all cells in one column 'col' are distinct
(define-fun UniquePerCol ((col Int)) Bool
	(distinct (B 1 col)
			  (B 2 col)
			  (B 3 col)
			  (B 4 col)
			  (B 5 col)
			  (B 6 col)
			  (B 7 col)
			  (B 8 col)
			  (B 9 col)
	)
)
; all cells in one (3x3) block 'block' are distinct
; note the calculations to get the row+col from a block-number
(define-fun UniquePerBlock ((block Int)) Bool
	(distinct (B (+ (* 3 (div block 3)) 1) (+ (* 3 (mod block 3)) 1))
			  (B (+ (* 3 (div block 3)) 2) (+ (* 3 (mod block 3)) 1))
			  (B (+ (* 3 (div block 3)) 3) (+ (* 3 (mod block 3)) 1))
			  (B (+ (* 3 (div block 3)) 1) (+ (* 3 (mod block 3)) 2))
			  (B (+ (* 3 (div block 3)) 2) (+ (* 3 (mod block 3)) 2))
			  (B (+ (* 3 (div block 3)) 3) (+ (* 3 (mod block 3)) 2))
			  (B (+ (* 3 (div block 3)) 1) (+ (* 3 (mod block 3)) 3))
			  (B (+ (* 3 (div block 3)) 2) (+ (* 3 (mod block 3)) 3))
			  (B (+ (* 3 (div block 3)) 3) (+ (* 3 (mod block 3)) 3))
	)
)

; all cells in all rows are distinct
(define-fun UniqueAllRows () Bool
	(and
		(UniquePerRow 1)
		(UniquePerRow 2)
		(UniquePerRow 3)
		(UniquePerRow 4)
		(UniquePerRow 5)
		(UniquePerRow 6)
		(UniquePerRow 7)
		(UniquePerRow 8)
		(UniquePerRow 9)
	)
)
; all cells in all columns are distinct
(define-fun UniqueAllCols () Bool
	(and
		(UniquePerCol 1)
		(UniquePerCol 2)
		(UniquePerCol 3)
		(UniquePerCol 4)
		(UniquePerCol 5)
		(UniquePerCol 6)
		(UniquePerCol 7)
		(UniquePerCol 8)
		(UniquePerCol 9)
	)
)
; all cells in all blocks are distinct
; (blocks are from 0..8 (for the div/mod calculations))
(define-fun UniqueAllBlocks () Bool
	(and
		(UniquePerBlock 0)
		(UniquePerBlock 1)
		(UniquePerBlock 2)
		(UniquePerBlock 3)
		(UniquePerBlock 4)
		(UniquePerBlock 5)
		(UniquePerBlock 6)
		(UniquePerBlock 7)
		(UniquePerBlock 8)
	)
)

; cell at ('row','col') is between 1..9
(define-fun MinmaxRowCol ((row Int) (col Int)) Bool
	(and (>= (B row col) 1) (<= (B row col) 9))
)

; for all rows, cell at column 'col' is between 1..9
(define-fun MinmaxAllRow ((col Int)) Bool
	(and (MinmaxRowCol 1 col)
		 (MinmaxRowCol 2 col)
		 (MinmaxRowCol 3 col)
		 (MinmaxRowCol 4 col)
		 (MinmaxRowCol 5 col)
		 (MinmaxRowCol 6 col)
		 (MinmaxRowCol 7 col)
		 (MinmaxRowCol 8 col)
		 (MinmaxRowCol 9 col)
	)
)

; all cells are between 1..9
(define-fun MinmaxAllRowAllCol () Bool
	(and (MinmaxAllRow 1)
		 (MinmaxAllRow 2)
		 (MinmaxAllRow 3)
		 (MinmaxAllRow 4)
		 (MinmaxAllRow 5)
		 (MinmaxAllRow 6)
		 (MinmaxAllRow 7)
		 (MinmaxAllRow 8)
		 (MinmaxAllRow 9)
	)
)

(assert (and
	UniqueAllRows
	UniqueAllCols
	UniqueAllBlocks
	MinmaxAllRowAllCol
))

; instance to solve
(assert (= (B 1 7) 8))
(assert (= (B 2 1) 4))
(assert (= (B 2 4) 2))
(assert (= (B 2 5) 8))
(assert (= (B 2 9) 6))
(assert (= (B 3 6) 7))
(assert (= (B 3 8) 3))
(assert (= (B 4 3) 6))
(assert (= (B 4 6) 3))
(assert (= (B 4 8) 2))
(assert (= (B 4 9) 1))
(assert (= (B 5 1) 5))
(assert (= (B 5 2) 4))
(assert (= (B 5 5) 1))
(assert (= (B 5 8) 7))
(assert (= (B 5 9) 8))
(assert (= (B 6 1) 1))
(assert (= (B 6 2) 2))
(assert (= (B 6 4) 5))
(assert (= (B 6 7) 6))
(assert (= (B 7 2) 7))
(assert (= (B 7 4) 3))
(assert (= (B 8 1) 3))
(assert (= (B 8 5) 6))
(assert (= (B 8 6) 1))
(assert (= (B 8 9) 4))
(assert (= (B 9 3) 5))

; ***********
; * 4  51 3 *
; *    427  *
; *   6    5*
; * 2   53  *
; * 8  1  6 *
; *  73   1 *
; *8    6   *
; *  327    *
; * 6 18  4 *
; ***********

; solving...
(check-sat)
(get-model)
