;enumarable with all the possible letters from the English alphabet
(declare-datatypes () ((Char A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)))

; every side from every die
(declare-const char1Dice1 Char)
(declare-const char2Dice1 Char)
(declare-const char3Dice1 Char)

(declare-const char1Dice2 Char)
(declare-const char2Dice2 Char)
(declare-const char3Dice2 Char)

(declare-const char1Dice3 Char)
(declare-const char2Dice3 Char)
(declare-const char3Dice3 Char)

(declare-const char1Dice4 Char)
(declare-const char2Dice4 Char)
(declare-const char3Dice4 Char)

;attempts to assign a letter on one of the sides of die 1  
(define-fun Die1Assignment ((c Char)) Bool
    (xor
        (= char1Dice1 c)
        (= char2Dice1 c)
        (= char3Dice1 c)
    )
)

;attempts to assign a letter on one of the sides of die 2
(define-fun Die2Assignment ((c Char)) Bool
    (xor
        (= char1Dice2 c)
        (= char2Dice2 c)
        (= char3Dice2 c)
    )
)

;attempts to assign a letter on one of the sides of die 3
(define-fun Die3Assignment ((c Char)) Bool
    (xor
        (= char1Dice3 c)
        (= char2Dice3 c)
        (= char3Dice3 c)
    )
)

;attempts to assign a letter on one of the sides of die 4
(define-fun Die4Assignment ((c Char)) Bool
    (xor
        (= char1Dice4 c)
        (= char2Dice4 c)
        (= char3Dice4 c)
    )
)

;restrains a letter from the word to be only on one die 
(define-fun charAssignment ((c Char)) Bool
    (xor
        (Die1Assignment c)
        (Die2Assignment c)
        (Die3Assignment c)
        (Die4Assignment c)
    )
)

;restrains two letters from one word to be on the same die
(define-fun CharPair ((c1 Char) (c2 Char)) Bool
    (not
        (or
            (and
                (Die1Assignment c1)
                (Die1Assignment c2)
            ) 
            (and
                (Die2Assignment c1)
                (Die2Assignment c2)
            )
            (and
                (Die3Assignment c1)
                (Die3Assignment c2)
            )
            (and
                (Die4Assignment c1)
                (Die4Assignment c2)
            )  
        )
    )
)

;possible combinations of all letters in a given word  
(define-fun CombinationCharPair ((c1 Char) (c2 Char) (c3 Char)) Bool
    (and
        (CharPair c1 c2)
        (CharPair c1 c3)
        (CharPair c2 c3)
    )
)

;assign all the letters of the word to the dice and make sure that no two letters are on the same die
(define-fun WordAssignment ((c1 Char) (c2 Char) (c3 Char)) Bool
    (and
        (charAssignment c1)
        (charAssignment c2)
        (charAssignment c3)

        (CombinationCharPair c1 c2 c3)
    )
)

(assert
    ;lists all the word from the exercise
    (and
        (WordAssignment C A T)
        (WordAssignment S O N)
        (WordAssignment P O D)
        (WordAssignment R I G)
        (WordAssignment P E G)
        (WordAssignment T A P)
        (WordAssignment D I N)
        (WordAssignment A P E)
    )
)

(check-sat)
(get-model)
(exit)