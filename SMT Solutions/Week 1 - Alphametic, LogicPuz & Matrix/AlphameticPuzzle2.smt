(declare-const S Int) 
(declare-const E Int) 
(declare-const N Int)
(declare-const D Int)  
(declare-const M Int)  
(declare-const O Int)
(declare-const R Int)
(declare-const Y Int)

(declare-const FirstWord Int) 
(declare-const SecondWord Int) 
(declare-const Result Int) 

(assert(and (not(= S E)) (not(= S N)) (not(= S D)) (not(= S M)) (not(= S O)) (not(= S R)) (not(= S Y))))
(assert(and (not(= E S)) (not(= E N)) (not(= E D)) (not(= E M)) (not(= E O)) (not(= E R)) (not(= E Y))))
(assert(and (not(= N E)) (not(= N S)) (not(= N D)) (not(= N M)) (not(= N O)) (not(= N R)) (not(= N Y))))
(assert(and (not(= D E)) (not(= D N)) (not(= D E)) (not(= D M)) (not(= D O)) (not(= D R)) (not(= D Y))))
(assert(and (not(= M E)) (not(= M N)) (not(= M D)) (not(= M S)) (not(= M O)) (not(= M R)) (not(= M Y))))
(assert(and (not(= O E)) (not(= O N)) (not(= O D)) (not(= O M)) (not(= O S)) (not(= O R)) (not(= O Y))))
(assert(and (not(= R E)) (not(= R N)) (not(= R D)) (not(= R M)) (not(= R O)) (not(= R S)) (not(= R Y))))
(assert(and (not(= Y E)) (not(= Y N)) (not(= Y D)) (not(= Y M)) (not(= Y O)) (not(= Y R)) (not(= Y S))))
(assert (and (< S 10) (> S 0)))
(assert (and (< E 10) (>= E 0)))
(assert (and (< N 10) (>= N 0)))
(assert (and (< D 10) (>= D 0)))
(assert (and (< M 10) (> M 0)))
(assert (and (< O 10) (>= O 0)))
(assert (and (< R 10) (>= R 0))) 
(assert (and (< Y 10) (>= Y 0))) 



(assert (and(< FirstWord 10000) (> FirstWord 999)))
(assert (and(< SecondWord 10000) (> SecondWord 999)))
(assert (and(< Result 100000) (> Result 9999)))

(assert(= FirstWord (+ (* S 1000) (* E 100) (* N 10) D)))
(assert(= SecondWord (+ (* M 1000) (* O 100) (* R 10) E)))
(assert(= Result (+ (* M 10000) (* O 1000) (* N 100) (* E 10) Y)))
(assert(= Result (+ FirstWord SecondWord)))


(check-sat)
(get-model)