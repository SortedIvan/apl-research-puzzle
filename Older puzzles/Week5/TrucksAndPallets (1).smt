; Custom datatypes for each type of pallet
(declare-datatypes () ((Pallets nuzzles prittles skipples crottles dupples)))

; Truck (Truck Number, Type of Pallet) -> Returns the number of pallets of for specified truck
(declare-fun TruckPallets (Int Pallets) Int)

; Maximum kilogram and amount capacity
(declare-const MaxKGCapacity Int)
(declare-const MaxPalletCapacity Int)

(assert
    (and
        (= MaxKGCapacity 8000)
        (= MaxPalletCapacity 8)
    )
)

; Number of pallets of each type
(declare-const Nuzzles Int)
(declare-const Prittles Int)
(declare-const Skipples Int)
(declare-const Crottles Int)
(declare-const Dupples Int)

(declare-const N Int) ; Number of Prittles

(assert
    (and
        (= Nuzzles 4)
        (= Prittles N)
        (= Skipples 8)
        (= Crottles 8)
        (= Dupples 12)
    )
)

; Weight for each pallet type
(declare-const NuzzlesWeight Int)
(declare-const PrittlesWeight Int)
(declare-const SkipplesWeight Int)
(declare-const CrottlesWeight Int)
(declare-const DupplesWeight Int)

(assert
    (and
        (= NuzzlesWeight 800)
        (= PrittlesWeight 1300)
        (= SkipplesWeight 1000)
        (= CrottlesWeight 1500)
        (= DupplesWeight 400)
    )
)

; Each truck should have 0 or more of each pallet type
(define-fun truckPalletConstraints ((truckNr Int)) Bool
    (and
        (>= (TruckPallets truckNr nuzzles) 0)
        (>= (TruckPallets truckNr skipples) 0)
        (>= (TruckPallets truckNr prittles) 0)
        (>= (TruckPallets truckNr crottles) 0)
        (>= (TruckPallets truckNr dupples) 0)
    )
)

; Capacity constraints
(define-fun checkTruckCapacity ((truckNr Int)) Bool
    (and
        ; The amount of pallets in truck should be less than or equal the Maximum Pallet Capacity
        (<= 
            (+ 
                (TruckPallets truckNr nuzzles)
                (TruckPallets truckNr skipples)
                (TruckPallets truckNr prittles)
                (TruckPallets truckNr crottles)
                (TruckPallets truckNr dupples)
            )
            MaxPalletCapacity
        )
        ; The total truck capacity should be less than or equal the Maximum Kilogram Capacity
        (<= 
            (+ 
                (* (TruckPallets truckNr nuzzles) NuzzlesWeight)
                (* (TruckPallets truckNr skipples) SkipplesWeight)
                (* (TruckPallets truckNr prittles) PrittlesWeight)
                (* (TruckPallets truckNr crottles) CrottlesWeight)
                (* (TruckPallets truckNr dupples) DupplesWeight)
            )
            MaxKGCapacity
        )
    )
)

; Distribute all Nuzzle pallets among the six trucks
(define-fun distributeNuzzles () Bool
    (and
        (=
            (+ 
                (TruckPallets 1 nuzzles)
                (TruckPallets 2 nuzzles)
                (TruckPallets 3 nuzzles)
                (TruckPallets 4 nuzzles)
                (TruckPallets 5 nuzzles)
                (TruckPallets 6 nuzzles)
            )
            Nuzzles
        )

        ; Each truck can have at most 1 Nuzzle pallet
        (<= (TruckPallets 1 nuzzles) 1)
        (<= (TruckPallets 2 nuzzles) 1)
        (<= (TruckPallets 3 nuzzles) 1)
        (<= (TruckPallets 4 nuzzles) 1)
        (<= (TruckPallets 5 nuzzles) 1)
        (<= (TruckPallets 6 nuzzles) 1)
    )
    
)

; Distribute all Prittle pallets among the six trucks
(define-fun distributePrittles () Bool
    (and
        (=
            (+ 
                (TruckPallets 1 prittles)
                (TruckPallets 2 prittles)
                (TruckPallets 3 prittles)
                (TruckPallets 4 prittles)
                (TruckPallets 5 prittles)
                (TruckPallets 6 prittles)
            )
            Prittles
        )
    )
)

; Distribute all Skipple pallets among the six trucks
(define-fun distributeSkipples () Bool
    (and
        (=
            (+ 
                (TruckPallets 1 skipples)
                (TruckPallets 2 skipples)
                (TruckPallets 3 skipples)
                (TruckPallets 4 skipples)
                (TruckPallets 5 skipples)
                (TruckPallets 6 skipples)
            )
            Skipples
        )

        ; Only two trucks can have any skipples pallets
        (=
            (+
                (ite (> (TruckPallets 1 skipples) 0) 1 0)
                (ite (> (TruckPallets 2 skipples) 0) 1 0)
                (ite (> (TruckPallets 3 skipples) 0) 1 0)
                (ite (> (TruckPallets 4 skipples) 0) 1 0)
                (ite (> (TruckPallets 5 skipples) 0) 1 0)
                (ite (> (TruckPallets 6 skipples) 0) 1 0)
            )
            2
        )
    )
)

; Distribute all Crottle pallets among the six trucks
(define-fun distributeCrottles () Bool
    (and
        (=
            (+ 
                (TruckPallets 1 crottles)
                (TruckPallets 2 crottles)
                (TruckPallets 3 crottles)
                (TruckPallets 4 crottles)
                (TruckPallets 5 crottles)
                (TruckPallets 6 crottles)
            )
            Crottles
        )
    )
)

; Distribute all Dupple pallets among the six trucks
(define-fun distributeDupples () Bool
    (and
        (=
            (+ 
                (TruckPallets 1 dupples)
                (TruckPallets 2 dupples)
                (TruckPallets 3 dupples)
                (TruckPallets 4 dupples)
                (TruckPallets 5 dupples)
                (TruckPallets 6 dupples)
            )
            Dupples
        )
    )
)

; Distributing all pallets
(define-fun distributePallets () Bool
    (and
        distributeNuzzles
        distributePrittles
        distributeSkipples
        distributeCrottles
        distributeDupples
    )
)

(assert
    (and
        ; Capacity constraints for each truck
        (checkTruckCapacity 1)
        (checkTruckCapacity 2)
        (checkTruckCapacity 3)
        (checkTruckCapacity 4)
        (checkTruckCapacity 5)
        (checkTruckCapacity 6)

        (truckPalletConstraints 1)
        (truckPalletConstraints 2)
        (truckPalletConstraints 3)
        (truckPalletConstraints 4)
        (truckPalletConstraints 5)
        (truckPalletConstraints 6)

        distributePallets
    )
)

; Maximum number of Prittles that can be distributed among the trucks
(maximize N)
(check-sat)
(get-model)
(exit)