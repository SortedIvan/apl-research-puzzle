(declare-datatypes () ((ShirtColor black blue orange red white)))
(declare-datatypes () ((Name Austin Colin Edgar John Peter)))
(declare-datatypes () ((Product cellPhone drone laptop smartwatch tv)))

; Customer 1
(declare-const C1Shirt ShirtColor)
(declare-const C1Name Name )
(declare-const C1Product Product )
(declare-const C1Discount Int)
(declare-const C1Delivery Int )
(declare-const C1Age Int )

; Customer 2
(declare-const C2Shirt ShirtColor)
(declare-const C2Name Name )
(declare-const C2Product Product )
(declare-const C2Discount Int)
(declare-const C2Delivery Int )
(declare-const C2Age Int )

; Customer 3
(declare-const C3Shirt ShirtColor)
(declare-const C3Name Name )
(declare-const C3Product Product )
(declare-const C3Discount Int)
(declare-const C3Delivery Int )
(declare-const C3Age Int )

; Customer 4
(declare-const C4Shirt ShirtColor)
(declare-const C4Name Name )
(declare-const C4Product Product )
(declare-const C4Discount Int)
(declare-const C4Delivery Int )
(declare-const C4Age Int )

; Customer 5
(declare-const C5Shirt ShirtColor)
(declare-const C5Name Name )
(declare-const C5Product Product )
(declare-const C5Discount Int)
(declare-const C5Delivery Int )
(declare-const C5Age Int )

; The customer is exactly to the left of the customer whose delivery is some value.
(define-fun AgeDiscountLeft( (age Int) (delivery Int) ) Bool
    (xor
        (and (= C1Age age) (= C2Delivery delivery))
        (and (= C2Age age) (= C3Delivery delivery))
        (and (= C3Age age) (= C4Delivery delivery))
        (and (= C4Age age) (= C5Delivery delivery))
    )
)

; The man wearing a given shirt color is somewhere between the man who got the biggest discount and the man who got the lowest discount, in that order.
(define-fun ShirtDiscountDiscountBetween ( (shirtcolor1 ShirtColor) (discountMax Int) (discountMin Int) ) Bool
    (xor  
        (and (= C2Shirt shirtcolor1) (= C1Discount discountMax) (xor (= C3Discount discountMin) (= C4Discount discountMin) (= C5Discount discountMin)))
        (and (= C3Shirt shirtcolor1) (xor (= C1Discount discountMax) (= C2Discount discountMax)) (xor (= C4Discount discountMin) (= C5Discount discountMin)))
        (and (= C4Shirt shirtcolor1) (xor (= C1Discount discountMax) (= C2Discount discountMax) (= C3Discount discountMax)) (= C5Discount discountMin))
    )
)

; The customer is next to the customer who got a discount.
(define-fun ageDiscountNextTo ( (age Int) (discount Int) ) Bool
    (xor
        (xor
            (and (= C1Age age) (= C2Discount discount))
            (and (= C3Age age) (= C2Discount discount))
        )
        (xor
            (and (= C2Age age) (= C3Discount discount))
            (and (= C4Age age) (= C3Discount discount))
        )
        (xor
            (and (= C3Age age) (= C4Discount discount))
            (and (= C5Age age) (= C4Discount discount))
        )
        (and (= C2Age age) (= C1Discount discount))
        (and (= C4Age age) (= C5Discount discount))
    )
)

; The man wearing a given shirt color is somewhere to the left of the man that saved using a given discount.
(define-fun ShirtDiscountSomewhereLeft ( (discount Int) (shirtColor ShirtColor) ) Bool

    (xor
        (and (= C2Discount discount) (= C1Shirt shirtColor))
        (and (= C3Discount discount) (xor (= C1Shirt shirtColor) (= C2Shirt shirtColor) ))
        (and (= C4Discount discount) (xor (= C1Shirt shirtColor) (= C2Shirt shirtColor) (= C3Shirt shirtColor) ))
        (and (= C5Discount discount) (xor (= C1Shirt shirtColor) (= C2Shirt shirtColor) (= C3Shirt shirtColor) (= C4Shirt shirtColor) ))
    )
)

; The man wearing a given shirt color is somewhere between a person with a given name and the man wearing the another shirt color, in that order.
(define-fun ShirtNameShirtBetween ( (shirtcolor1 ShirtColor) (name Name) (shirtcolor2 ShirtColor) )  Bool
    (xor  
        (and (= C2Shirt shirtcolor1) (= C1Name name) (xor (= C3Shirt shirtcolor2) (= C4Shirt shirtcolor2) (= C5Shirt shirtcolor2)))
        (and (= C3Shirt shirtcolor1) (xor (= C1Name name) (= C2Name name)) (xor (= C4Shirt shirtcolor2) (= C5Shirt shirtcolor2)))
        (and (= C4Shirt shirtcolor1) (xor (= C1Name name) (= C2Name name) (= C3Name name)) (= C5Shirt shirtcolor2))
    )
)

; It will take a given number of days to delivery a provided type of product.
(define-fun DeliveryProduct ( (delivery Int) (product Product) ) Bool
    (xor
        (and (= C1Delivery delivery) (= C1Product product))
        (and (= C2Delivery delivery) (= C2Product product))
        (and (= C3Delivery delivery) (= C3Product product))
        (and (= C4Delivery delivery) (= C4Product product))
        (and (= C5Delivery delivery) (= C5Product product))
    )
)

; The man who got a discount is exactly to the left of the man who got a another discount.
(define-fun DiscountDiscountLeft( (discount1 Int) (discount2 Int) ) Bool
    (xor
        (and (= C1Discount discount1) (= C2Discount discount2))
        (and (= C2Discount discount1) (= C3Discount discount2))
        (and (= C3Discount discount1) (= C4Discount discount2))
        (and (= C4Discount discount1) (= C5Discount discount2))
    )
)

; The customer with a given age is exactly to the right of another customer with different age.
(define-fun ageAgeRight( (age1 Int) (age2 Int) ) Bool
    (xor
        (and (= C1Age age2) (= C2Age age1))
        (and (= C2Age age2) (= C3Age age1))
        (and (= C3Age age2) (= C4Age age1))
        (and (= C4Age age2) (= C5Age age1))
    )
)

; The man wearing a given shirt color is somewhere between the man who will wait for their delivery and another man who bought a given product, in that order.
(define-fun ShirtDeliveryProductBetween ( (shirtColor ShirtColor) (delivery Int) (product Product) ) Bool
    (xor  
        (and (= C2Shirt shirtColor) (= C1Delivery delivery) (xor (= C3Product product) (= C4Product product) (= C5Product product)))
        (and (= C3Shirt shirtColor) (xor (= C1Delivery delivery) (= C2Delivery delivery)) (xor (= C4Product product) (= C5Product product)))
        (and (= C4Shirt shirtColor) (xor (= C1Delivery delivery) (= C2Delivery delivery) (= C3Delivery delivery)) (= C5Product product))
    )
)

; Matching customer name with age
(define-fun nameAge ( (name Name) (age Int) ) Bool
    (xor
        (and (= C1Name name) (= C1Age age))
        (and (= C2Name name) (= C2Age age))
        (and (= C3Name name) (= C3Age age))
        (and (= C4Name name) (= C4Age age))
        (and (= C5Name name) (= C5Age age))
    )
)

; The customer wearing a given shirt color is exactly to the right of the a man of certain age.
(define-fun shirtAgeRight( (shirtcolor ShirtColor) (age Int) ) Bool
    (xor
        (and (= C1Age age) (= C2Shirt shirtcolor))
        (and (= C2Age age) (= C3Shirt shirtcolor))
        (and (= C3Age age) (= C4Shirt shirtcolor))
        (and (= C4Age age) (= C5Shirt shirtcolor))
    )
)

; Customer with a given name is somewhere between the man that will wait certain number of days for his delivery and another customer with a given name, in that order.
(define-fun NameDeliveryNameBetween ( (name1 Name) (delivery Int) (name2 Name) ) Bool
    (xor  
        (and (= C2Name name1) (= C1Delivery delivery) (xor (= C3Name name2) (= C4Name name2) (= C5Name name2)))
        (and (= C3Name name1) (xor (= C1Delivery delivery) (= C2Delivery delivery)) (xor (= C4Name name2) (= C5Name name2)))
        (and (= C4Name name1) (xor (= C1Delivery delivery) (= C2Delivery delivery) (= C3Delivery delivery)) (= C5Name name2))
    )
)

; The customer who bought a given product is exactly to the left of the customer who another type of product
(define-fun ProductProductLeft( (product1 Product) (product2 Product) ) Bool
    (xor
        (and (= C1Product product1) (= C2Product product2))
        (and (= C2Product product1) (= C3Product product2))
        (and (= C3Product product1) (= C4Product product2))
        (and (= C4Product product1) (= C5Product product2))
    )
)

; The man whose delivery will a given number of days to arrive is somewhere to the right of the man wearing a given shirt color.
(define-fun DeliveryShirtSomewhereRight ( (delivery Int) (shirtColor ShirtColor) ) Bool

    (xor
        (and (= C1Shirt shirtColor) (xor (= C2Delivery delivery) (= C3Delivery delivery) (= C4Delivery delivery) (= C5Delivery delivery) ))
        (and (= C2Shirt shirtColor) (xor (= C3Delivery delivery) (= C4Delivery delivery) (= C5Delivery delivery) ))
        (and (= C3Shirt shirtColor) (xor (= C4Delivery delivery) (= C5Delivery delivery) ))
        (and (= C4Shirt shirtColor) (= C5Delivery delivery))
    )
)

; The man that bought a given product is somewhere between the man wearing a given shirt color and the man who got a certain discount, in that order.
(define-fun ProductshirtDiscountBeetween ( (product Product) (shirtColor ShirtColor) (discount Int) ) Bool
    (xor  
        (and (= C2Product product) (= C1Shirt shirtColor) (xor (= C3Discount discount) (= C4Discount discount) (= C5Discount discount)))
        (and (= C3Product product) (xor (= C1Shirt shirtColor) (= C2Shirt shirtColor)) (xor (= C4Discount discount) (= C5Discount discount)))
        (and (= C4Product product) (xor (= C1Shirt shirtColor) (= C2Shirt shirtColor) (= C3Shirt shirtColor)) (= C5Discount discount))
    )
)

; A customer with a given name is exactly to the right of the man that will wait a certain number of days to get his product.
(define-fun nameDeliveryRight ( (name Name) (delivery Int) ) Bool
    (xor
        (and (= C1Delivery delivery) (= C2Name name))
        (and (= C2Delivery delivery) (= C3Name name))
        (and (= C3Delivery delivery) (= C4Name name))
        (and (= C4Delivery delivery) (= C5Name name))
    )
)

(assert 
    (and
        (AgeDiscountLeft 22 2)
        (ShirtDiscountDiscountBetween white 60 20)
        (ageDiscountNextTo 22 20)
        (ShirtDiscountSomewhereLeft 30 orange)
        (xor (= C1Age 20) (= C5Age 20)) ; At one of the ends is the youngest costumer.
        (ShirtNameShirtBetween white Colin red)
        (= C4Shirt orange) ; At the fourth position is the customer wearing the Orange shirt.
        (DeliveryProduct 3 laptop)
        (DiscountDiscountLeft 40 20)
        (ageAgeRight 22 21)
        (ShirtDeliveryProductBetween white 6 cellPhone)
        (nameAge Edgar 23)
        (shirtAgeRight black 24)
        (NameDeliveryNameBetween Peter 5 John)
        (ProductProductLeft drone laptop)
        (DeliveryShirtSomewhereRight 4 orange)
        (ProductshirtDiscountBeetween tv blue 20)
        (ageDiscountNextTo 20 50)
        (nameDeliveryRight Edgar 5)        

        (and (>= C1Delivery 2) (<= C1Delivery 6))
        (and (>= C2Delivery 2) (<= C2Delivery 6))
        (and (>= C3Delivery 2) (<= C3Delivery 6))
        (and (>= C4Delivery 2) (<= C4Delivery 6))
        (and (>= C5Delivery 2) (<= C5Delivery 6))

        (and (>= C1Age 20) (<= C1Age 24))
        (and (>= C2Age 20) (<= C2Age 24))
        (and (>= C3Age 20) (<= C3Age 24))
        (and (>= C4Age 20) (<= C4Age 24))
        (and (>= C5Age 20) (<= C5Age 24))

        (xor (= C1Discount 20) (= C1Discount 30) (= C1Discount 40) (= C1Discount 50) (= C1Discount 60))
        (xor (= C2Discount 20) (= C2Discount 30) (= C2Discount 40) (= C2Discount 50) (= C2Discount 60))
        (xor (= C3Discount 20) (= C3Discount 30) (= C3Discount 40) (= C3Discount 50) (= C3Discount 60))
        (xor (= C4Discount 20) (= C4Discount 30) (= C4Discount 40) (= C4Discount 50) (= C4Discount 60))
        (xor (= C5Discount 20) (= C5Discount 30) (= C5Discount 40) (= C5Discount 50) (= C5Discount 60))
    )
)

(check-sat)
(get-model)
(exit)
