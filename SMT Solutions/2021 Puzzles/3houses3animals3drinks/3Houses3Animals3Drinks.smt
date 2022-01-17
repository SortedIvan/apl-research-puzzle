; Colors => Colors nr and returns house nr
(declare-fun Color (Int) Int)

; Animals => Animals nr and returns house nr
(declare-fun Animal (Int) Int)

; Drinks => Drinks nr and returns house nr
(declare-fun Drink (Int) Int)


;the values of each type should be distinct
(define-fun DiffValues ((v1 Int) (v2 Int) (v3 Int)) Bool
    (and
        (distinct 
          (Color v1) (Color v2) (Color v3)
        )
        (distinct 
          (Animal v1) (Animal v2) (Animal v3)
        )
        (distinct 
          (Drink v1) (Drink v2) (Drink v3)
        )
    )
)

;Pink 1
;Red 2
;Yellow 3

;Fish 1
;Mouse 2
;Zebra 3

;Tea 1
;Coffee 2
;Beer 3

; the fish live in the pink house 
; the person drinking tea lives directly to the left of the pink house
; the thirh house is not red 
; the person in house two drinks beer 
; the zerbe lives directly to the left of the fish.
; 1 is left ; 2 is middle ; 3 is right
(define-fun conditions () Bool
  (and
    (= (Animal 1) (Color 1)) ; the fish live in the pink house 
    (< (Drink 1) (Color 1))  ;the person drinking tea lives directly to the left of the pink house
    (not (= 3 (Color 2))) ;the thirh house is not red 
    (= 2 (Drink 3)) ;the person in house two drinks beer 
    (< (Animal 3) (Animal 1)) ; the zerbe lives directly to the left of the fish.
  )
)


(assert (and

    ; Houses , Colors and Animals should be between 1 and 3 
    (forall ((c Int) (a Int) (d Int))
        (=>
            (and
                (<= 1 c 3)
                (<= 1 a 3)
                (<= 1 d 3)
            )
            (and
                (<= 1 (Color c) 3)
                (<= 1 (Animal a) 3)
                (<= 1 (Drink d) 3)
            )
        )
    )
    
    ; make sure they have different values
    (forall ((v1 Int) (v2 Int) (v3 Int))
        (=>
            (and
                (<= 1 v1 3)
                (<= 1 v2 3)
                (<= 1 v3 3)
                (distinct v1 v2 v3)
            )
            (DiffValues v1 v2 v3)
        )
    )
    ; assert the coditions 
    conditions
    


))


(check-sat)
(get-value(
  ;;
  ;Colors
  (Color 1) 
  (Animal 1)
  (Drink 1)
  
  ;;
  ;Animals
  (Color 2)
  (Animal 2)
  (Drink 2)

  ;;
  ;Drinks
  (Color 3)
  (Animal 3)
  (Drink 3)
  
))