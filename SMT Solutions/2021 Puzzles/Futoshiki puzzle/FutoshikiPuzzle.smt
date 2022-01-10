(declare-fun G (Int Int) Int)

(define-fun MaxValue ((x Int)) Bool
	(and
		(<= 1 (G x 1) 6)
		(<= 1 (G x 2) 6)
		(<= 1 (G x 3) 6)
		(<= 1 (G x 4) 6)
		(<= 1 (G x 5) 6)
		(<= 1 (G x 6) 6)
	)
)

(define-fun DistinctCol ((x Int)) Bool
	(and
		(distinct (G x 1) (G x 2) (G x 3) (G x 4) (G x 5) (G x 6))
	)
)

(define-fun DistinctRow ((y Int)) Bool
	(and
		(distinct (G 1 y) (G 2 y) (G 3 y) (G 4 y) (G 5 y) (G 6 y))
	)
)

(assert (and

	;IN CASE OF EXAM CHANGE
	(= (G 1 2) 4)
	(= (G 2 3) 3)
	(= (G 1 4) 2)

	(MaxValue 1) (MaxValue 2) (MaxValue 3) (MaxValue 4) (MaxValue 5) (MaxValue 6)

	(forall ((x Int))
          (implies 
            (and  
                (<= 1 x 6)  
            )
            (DistinctCol x)
          )
    )

	(forall ((y Int))
          (implies 
            (and  
                (<= 1 y 6)  
            )
            (DistinctRow y)
          )
    )


	;IN CASE OF EXAM CHANGE
	(> (G 1 1) (G 1 2))
	(< (G 1 2) (G 2 2))
	(> (G 6 2) (G 5 2))
	(> (G 1 3) (G 2 3))
	(> (G 4 3) (G 3 3))
	(> (G 6 3) (G 6 2))
	(> (G 3 4) (G 4 4))
	(> (G 4 4) (G 4 5))
	(> (G 5 4) (G 6 4))
	(> (G 1 5) (G 1 4))
	(> (G 4 5) (G 5 5))
	(> (G 6 5) (G 5 5))
	(> (G 3 6) (G 2 6))
	(> (G 3 6) (G 4 6))
	(> (G 5 6) (G 6 6))

))


(check-sat)
(get-value (
	;col1
	(G 1 1)
	(G 1 2)
	(G 1 3)
	(G 1 4)
	(G 1 5)
	(G 1 6)
	;col2
	(G 2 1)
	(G 2 2)
	(G 2 3)
	(G 2 4)
	(G 2 5)
	(G 2 6)
	;col3
	(G 3 1)
	(G 3 2)
	(G 3 3)
	(G 3 4)
	(G 3 5)
	(G 3 6)
	;col4
	(G 4 1)
	(G 4 2)
	(G 4 3)
	(G 4 4)
	(G 4 5)
	(G 4 6)
	;col5
	(G 5 1)
	(G 5 2)
	(G 5 3)
	(G 5 4)
	(G 5 5)
	(G 5 6)
	;col6
	(G 6 1)
	(G 6 2)
	(G 6 3)
	(G 6 4)
	(G 6 5)
	(G 6 6)	
))