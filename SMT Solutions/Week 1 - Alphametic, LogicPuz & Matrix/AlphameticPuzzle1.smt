(declare-const A Int) 
(declare-const S Int) 
(declare-const M Int)
(declare-const O Int)  
(declare-const FirstWord Int) 
(declare-const SecondWord Int) 
(declare-const Result Int) 

(assert(and (not(= A S )) (not(= A M)) (not(= A O))))
(assert(and (not(= S A )) (not(= S M)) (not(= S O))))
(assert(and (not(= M S )) (not(= M A)) (not(= M O))))
(assert(and (not(= O S )) (not(= O A)) (not(= O M))))

(assert (and (< A 10) (> A 0)))
(assert (and (< O 10) (>= O 0)))
(assert (and (< S 10) (> S 0)))
(assert (and (< M 10) (> M 0))) 


(assert (and(< FirstWord 100) (> FirstWord 9)))
(assert (and(< SecondWord 10) (> SecondWord 0)))
(assert (and(< Result 999) (> Result 99)))

(assert(= FirstWord (+ (* A 10) S)))
(assert(= SecondWord (+ A)))
(assert(= Result (+ (* M 100) (* O 10) M)))
(assert(= Result (+ FirstWord SecondWord)))


(check-sat)
(get-model)