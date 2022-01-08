;"Grid" represents the chess board
(declare-fun grid(Int Int) Bool)
;array of rows
(declare-fun Row (Int) Int)
;array of columns
(declare-fun Column (Int) Int)


;Make sure that only one queen can be per row.
(define-fun OnePerRow ((r Int)) Bool
    (and (= (Row r) (+
            (ite (grid r 1) 1 0)
            (ite (grid r 2) 1 0)
            (ite (grid r 3) 1 0)
            (ite (grid r 4) 1 0)
            (ite (grid r 5) 1 0)
            (ite (grid r 6) 1 0)
            (ite (grid r 7) 1 0)
            (ite (grid r 8) 1 0)

        )
    )
    (= (Row r) 1))
)
;Setting up the rows
(define-fun AllRows() Bool
    (and 
        (OnePerRow 1)
        (OnePerRow 2)
        (OnePerRow 3)
        (OnePerRow 4)
        (OnePerRow 5)
        (OnePerRow 6)
        (OnePerRow 7)
        (OnePerRow 8)
    )
)

;Make sure that only one queen can be per column.
(define-fun OnePerCol ((c Int)) Bool
    (and (= (Column c) (+
            (ite (grid 1 c) 1 0)
            (ite (grid 2 c) 1 0)
            (ite (grid 3 c) 1 0)
            (ite (grid 4 c) 1 0)
            (ite (grid 5 c) 1 0)
            (ite (grid 6 c) 1 0)
            (ite (grid 7 c) 1 0)
            (ite (grid 8 c) 1 0)

        )
    )
    (= (Column c) 1))
)

;Setting up the columns
(define-fun AllCols() Bool
    (and 
        (OnePerCol 1)
        (OnePerCol 2)
        (OnePerCol 3)
        (OnePerCol 4)
        (OnePerCol 5)
        (OnePerCol 6)
        (OnePerCol 7)
        (OnePerCol 8)
    )
)

;In the below functions, we check all the possible positions of 
;where a queen can be if within the board's diagonals.

(define-fun Diagonal ((v1 Bool) (v2 Bool) (v3 Bool) (v4 Bool) (v5 Bool) (v6 Bool) (v7 Bool) (v8 Bool)) Bool	
	(not (or 
			(and v1 v2) (and v1 v3) (and v1 v4) (and v1 v5) (and v1 v6) (and v1 v7) (and v1 v8) 
			(and v2 v3) (and v2 v4) (and v2 v5) (and v2 v6) (and v2 v7) (and v2 v8) 
		    (and v3 v4) (and v3 v5) (and v3 v6) (and v3 v7) (and v3 v8) 
		    (and v4 v5) (and v4 v6) (and v4 v7) (and v4 v8)
			(and v5 v6) (and v5 v7) (and v5 v8)
		    (and v6 v7) (and v6 v8)
		    (and v7 v8))))

(define-fun Diagonal1 ((v1 Bool) (v2 Bool) (v3 Bool) (v4 Bool) (v5 Bool) (v6 Bool) (v7 Bool)) Bool	
	(not (or 
			(and v1 v2) (and v1 v3) (and v1 v4) (and v1 v5) (and v1 v6) (and v1 v7)
			(and v2 v3) (and v2 v4) (and v2 v5) (and v2 v6) (and v2 v7)
		    (and v3 v4) (and v3 v5) (and v3 v6) (and v3 v7) 
		    (and v4 v5) (and v4 v6) (and v4 v7) 
			(and v5 v6) (and v5 v7) 
		    (and v6 v7))))
			
(define-fun Diagonal2 ((v1 Bool) (v2 Bool) (v3 Bool) (v4 Bool) (v5 Bool) (v6 Bool)) Bool	
	(not (or 
			(and v1 v2) (and v1 v3) (and v1 v4) (and v1 v5) (and v1 v6)
			(and v2 v3) (and v2 v4) (and v2 v5) (and v2 v6)
		    (and v3 v4) (and v3 v5) (and v3 v6) 
		    (and v4 v5) (and v4 v6)
			(and v5 v6) )))

(define-fun Diagonal3 ((v1 Bool) (v2 Bool) (v3 Bool) (v4 Bool) (v5 Bool)) Bool	
	(not (or 
			(and v1 v2) (and v1 v3) (and v1 v4) (and v1 v5)
			(and v2 v3) (and v2 v4) (and v2 v5) 
		    (and v3 v4) (and v3 v5) 
		    (and v4 v5))))
			
(define-fun Diagonal4 ((v1 Bool) (v2 Bool) (v3 Bool) (v4 Bool)) Bool	
	(not (or 
			(and v1 v2) (and v1 v3) (and v1 v4) 
			(and v2 v3) (and v2 v4) 
		    (and v3 v4))))
			
(define-fun Diagonal5 ((v1 Bool) (v2 Bool) (v3 Bool)) Bool	
	(not (or 
			(and v1 v2) (and v1 v3) 
			(and v2 v3))))

(define-fun Diagonal6 ((v1 Bool) (v2 Bool)) Bool	
	(not (or 
			(and v1 v2) )))
			

;Setting up the board
(assert (and
        AllCols
        AllRows

))

;Setting up the diagonals of the board	
(assert (and		

        (Diagonal   (grid 1 1) (grid 2 2) (grid 3 3) (grid 4 4) (grid 5 5) (grid 6 6) (grid 7 7) (grid 8 8))
		(Diagonal1  (grid 2 1) (grid 3 2) (grid 4 3) (grid 5 4) (grid 6 5) (grid 7 6) (grid 8 7))
		(Diagonal2  (grid 3 1) (grid 4 2) (grid 5 3) (grid 6 4) (grid 7 5) (grid 8 6))
		(Diagonal3  (grid 4 1) (grid 5 2) (grid 6 3) (grid 7 4) (grid 8 5))
		(Diagonal4  (grid 5 1) (grid 6 2) (grid 7 3) (grid 8 4))
		(Diagonal5  (grid 6 1) (grid 7 2) (grid 8 3))
		(Diagonal6  (grid 7 1) (grid 8 2))

        (Diagonal1  (grid 1 2) (grid 2 3) (grid 3 4) (grid 4 5) (grid 5 6) (grid 6 7) (grid 7 8))
		(Diagonal2  (grid 1 3) (grid 2 4) (grid 3 5) (grid 4 6) (grid 5 7) (grid 6 8))
		(Diagonal3  (grid 1 4) (grid 2 5) (grid 3 6) (grid 4 7) (grid 5 8))
		(Diagonal4  (grid 1 5) (grid 2 6) (grid 3 7) (grid 4 8))
		(Diagonal5  (grid 1 6) (grid 2 7) (grid 3 8))
		(Diagonal6  (grid 1 7) (grid 2 8))
		

        (Diagonal   (grid 1 8) (grid 2 7) (grid 3 6) (grid 4 5) (grid 5 4) (grid 6 3) (grid 7 2) (grid 8 1))
		(Diagonal1  (grid 1 7) (grid 2 6) (grid 3 5) (grid 4 4) (grid 5 3) (grid 6 2) (grid 7 1))
		(Diagonal2  (grid 1 6) (grid 2 5) (grid 3 4) (grid 4 3) (grid 5 2) (grid 6 1))
		(Diagonal3  (grid 1 5) (grid 2 4) (grid 3 3) (grid 4 2) (grid 5 1))
		(Diagonal4  (grid 1 4) (grid 2 3) (grid 3 2) (grid 4 1))
		(Diagonal5  (grid 1 3) (grid 2 2) (grid 3 1))
		(Diagonal6  (grid 1 2) (grid 2 1))
		

        (Diagonal1  (grid 2 8) (grid 3 7) (grid 4 6) (grid 5 5) (grid 6 4) (grid 7 3) (grid 8 2))
		(Diagonal2  (grid 3 8) (grid 4 7) (grid 5 6) (grid 6 5) (grid 7 4) (grid 8 3))
		(Diagonal3  (grid 4 8) (grid 5 7) (grid 6 6) (grid 7 5) (grid 8 4))
		(Diagonal4  (grid 5 8) (grid 6 7) (grid 7 6) (grid 8 5))
		(Diagonal5  (grid 6 8) (grid 7 7) (grid 8 6))
		(Diagonal6  (grid 7 8) (grid 8 7))

))
				
(check-sat)
(get-model)