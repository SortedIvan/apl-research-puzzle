; enumeration Field with 5 values: F1..F5
(declare-datatypes () ((Field F1 F2 F3 F4 F5)))

(declare-fun Aaa (Field) Int)

; giving the next field (round-robin)
(define-fun NEXT_FIELD ((f Field)) Field
	(ite (= f F1) F2
	(ite (= f F2) F3
	(ite (= f F3) F4
	(ite (= f F4) F5
	              F1
	))))
)

(assert (and
	; some arbitrary clauses...
	(exists ((f Field)) (= (Aaa f) 13))
	(forall ((f Field)) 
		(=>
			; note: why do we have this implication here?
			(not (= f F5))
			(= (Aaa f) (- (Aaa (NEXT_FIELD f)) 7)))
		)
))

(check-sat)
(get-model)