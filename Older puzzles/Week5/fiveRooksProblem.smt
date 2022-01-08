;(set-option :smt.arith.random_initial_value true)

; Declare the rows and columns as scalars
(declare-datatypes () ((ROW R1 R2 R3 R4 R5)))
(declare-datatypes () ((COL C1 C2 C3 C4 C5)))

; The chess board 
(declare-fun grid (ROW COL) Bool)
; false -> no rook 
; true -> rook

; Function which checks if there thre is another rook on the row or column
(define-fun function ((row ROW) (col COL)) Bool
    (and
        (not 
            (exists ( (i COL) )
                (and
                    (not (= i col))
                    (= (grid row i) true)
                )  
            )
        )
        (not 
            (exists ( (i ROW) )
                (and
                    (not (= i row))
                    (= (grid i col) true)
                )  
            )
        )
    )
)
; gets the next row
(define-fun NEXTROW ( (r ROW) ) ROW
    (ite (= r R1) R2
        (ite (= r R2) R3
        (ite (= r R3) R4
        (ite (= r R4) R5 R1))))
)
; gets the next column
(define-fun NEXTCOL ( (r COL) ) COL
    (ite (= r C1) C2
        (ite (= r C2) C3
        (ite (= r C3) C4
        (ite (= r C4) C5 C1))))
)
; gets the previous column
(define-fun PREVCOL ( (r COL) ) COL
    (ite (= r C5) C4
        (ite (= r C4) C3
        (ite (= r C3) C2
        (ite (= r C2) C1 C5))))
)
; gets the previous row
(define-fun PREVROW ( (r ROW) ) ROW
    (ite (= r R5) R4
        (ite (= r R4) R3
        (ite (= r R3) R2
        (ite (= r R2) R1 R5))))
)
; Function which checks if there is a neighboring rook  
(define-fun neighborCheck ( (r ROW) (c COL) ) Bool
   (and
        (not (grid (NEXTROW r) c))
        (not (grid (PREVROW r) c))
        (not (grid r (NEXTCOL c)))
        (not (grid r (PREVCOL c)))
        (not (grid (NEXTROW r) (NEXTCOL c)))
        (not (grid (PREVROW r) (NEXTCOL c)))
        (not (grid (PREVROW r) (PREVCOL c)))
        (not (grid (NEXTROW r) (PREVCOL c)))
   )
)

(assert
    (and
        ;goes through every row and column to call the two fucntion to see if it can place a rook there
        (forall ( (i ROW) (j COL) )
            (and
                (= (grid i j) (function i j))
                (ite (grid i j) 
                    ;then
                    (neighborCheck i j)
                    ;else
                    true
                )  
            )
        )
    )
)

(check-sat)
(get-model)
;(check-sat-using (using-params qflra :random_seed 3))
;(get-model)
(exit)