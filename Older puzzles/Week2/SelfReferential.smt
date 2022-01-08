;emumarable of all possible answers
(declare-datatypes () ((Answers A B C D E)))

;list of all question assignment
(declare-const Question1 Answers)
(declare-const Question2 Answers)
(declare-const Question3 Answers)
(declare-const Question4 Answers)
(declare-const Question5 Answers)
(declare-const Question6 Answers)
(declare-const Question7 Answers)
(declare-const Question8 Answers)
(declare-const Question9 Answers)
(declare-const Question10 Answers)


(define-fun letterToInt ((letter Answers)) Int
    (ite (= letter A) 1
        (ite (= letter B) 2
            (ite (= letter C) 3
                (ite (= letter D) 4
                    (ite (= letter E) 5 1
    )))))
)

;take the absolute value
(define-fun abs ((x Int)) Int
    (ite (> x 0) x (- 0 x))
)

;calculates the distance between two answers
(define-fun distanceBetweenAnswers ((thisQuestion Answers) (FollowingQuestion Answers)) Int
    (abs (- (letterToInt thisQuestion) (letterToInt FollowingQuestion)))
)

(define-fun isVowel ((questionAnswer Answers)) Bool
    (or (= questionAnswer A) (= questionAnswer E))
)

(define-fun isConsonant ((questionAnswer Answers)) Bool
    (or (= questionAnswer B) (= questionAnswer C) (= questionAnswer D))
)

;function for question 1 and 6
(define-fun Question1Fun ((question Answers) (TargetAnswer Answers) (q1 Answers) (q2 Answers) (q3 Answers) (q4 Answers) (q5 Answers)) Bool
    (xor
        (and (= q1 TargetAnswer) (= question A))
        (and (= q2 TargetAnswer) (= question B))
        (and (= q3 TargetAnswer) (= question C))
        (and (= q4 TargetAnswer) (= question D))
        (and (= q5 TargetAnswer) (= question E))
    )
)

;function for question 2
(define-fun Question2Fun ((question Answers)) Bool
    (or
        (and (= Question3 Question4) (= question A))
        (and (= Question4 Question5) (= question B))
        (and (= Question5 Question6) (= question C))
        (and (= Question6 Question7) (= question D))
        (and (= Question7 Question8) (= question E))
    )
)

;helper function to count how many questions have a given answer letter
(define-fun Question3Fun ((TargetAnswer Answers)) Int
    (+ 
        (ite (= Question1 TargetAnswer) 1 0 )
        (ite (= Question2 TargetAnswer) 1 0 )
        (ite (= Question3 TargetAnswer) 1 0 )
        (ite (= Question4 TargetAnswer) 1 0 )
        (ite (= Question5 TargetAnswer) 1 0 )
        (ite (= Question6 TargetAnswer) 1 0 )
        (ite (= Question7 TargetAnswer) 1 0 )
        (ite (= Question8 TargetAnswer) 1 0 )
        (ite (= Question9 TargetAnswer) 1 0 )
        (ite (= Question10 TargetAnswer) 1 0 )
    )
)

;function for question 3 and 4
(define-fun Question3Fun1 ((question Answers) (a Int) (b Int) (c Int) (d Int) (e Int) (TargetAnswer Answers)) Bool
    (xor
        (and (= (Question3Fun TargetAnswer) a) (= question A))
        (and (= (Question3Fun TargetAnswer) b) (= question B))
        (and (= (Question3Fun TargetAnswer) c) (= question C))
        (and (= (Question3Fun TargetAnswer) d) (= question D))
        (and (= (Question3Fun TargetAnswer) e) (= question E))
    )
)

;function for question 5
(define-fun Question5Fun ((question Answers) (TargetAnswer Answers)) Bool
    (or
        (and (= (Question3Fun TargetAnswer) (Question3Fun A)) (= question A))
        (and (= (Question3Fun TargetAnswer) (Question3Fun B)) (= question B))
        (and (= (Question3Fun TargetAnswer) (Question3Fun C)) (= question C))
        (and (= (Question3Fun TargetAnswer) (Question3Fun D)) (= question D))
        (and (= (Question3Fun TargetAnswer) (Question3Fun E)) (= question E))
    )
)

;function for question 7
(define-fun Question7Fun ((thisQuestion Answers) (FollowingQuestion Answers) (a Int) (b Int) (c Int) (d Int) (e Int)) Bool
    (xor
        (and (= (distanceBetweenAnswers thisQuestion FollowingQuestion) a) (= thisQuestion A))
        (and (= (distanceBetweenAnswers thisQuestion FollowingQuestion) b) (= thisQuestion B))
        (and (= (distanceBetweenAnswers thisQuestion FollowingQuestion) c) (= thisQuestion C))
        (and (= (distanceBetweenAnswers thisQuestion FollowingQuestion) d) (= thisQuestion D))
        (and (= (distanceBetweenAnswers thisQuestion FollowingQuestion) e) (= thisQuestion E))
    )
)

;function for question 8
(define-fun Question8Fun ((question Answers) (q1 Answers) (q2 Answers) (q3 Answers) (q4 Answers) (q5 Answers)) Bool
    (xor
        (= question q1)
        (= question q2)
        (= question q3)
        (= question q4)
        (= question q5)
    )
)

;helper function to count how many questions have a given answer letter which is a consonant
(define-fun Question9Fun () Int
    (+ 
        (ite (isConsonant Question1) 1 0 )
        (ite (isConsonant Question2) 1 0 )
        (ite (isConsonant Question3) 1 0 )
        (ite (isConsonant Question4) 1 0 )
        (ite (isConsonant Question5) 1 0 )
        (ite (isConsonant Question6) 1 0 )
        (ite (isConsonant Question7) 1 0 )
        (ite (isConsonant Question8) 1 0 )
        (ite (isConsonant Question9) 1 0 )
        (ite (isConsonant Question10) 1 0 )
    )
)

;function for question 9
(define-fun Question9Fun1 ((question Answers) (a Int) (b Int) (c Int) (d Int) (e Int)) Bool
    (xor
        (and (= Question9Fun a) (= question A))
        (and (= Question9Fun b) (= question B))
        (and (= Question9Fun c) (= question C))
        (and (= Question9Fun d) (= question D))
        (and (= Question9Fun e) (= question E))
    )
)

;function for question 10
(define-fun Question10Fun ((question Answers)) Bool
    (xor
        (= question A)
        (= question B)
        (= question C)
        (= question D)
        (= question E)
    )
)

(assert
    (and
        (Question1Fun Question1 D Question8 Question7 Question6 Question5 Question4)
        (Question2Fun Question2)
        (Question3Fun1 Question3 1 2 3 4 5 E)
        (Question3Fun1 Question4 1 2 3 4 5 A)
        (Question5Fun Question5 A)
        (Question1Fun Question6 B Question5 Question6 Question7 Question8 Question9)
        (Question7Fun Question7 Question8 4 3 2 1 0)
        (Question8Fun Question8 Question1 Question2 Question3 Question4 Question5)
        (Question9Fun1 Question9 3 4 5 6 7)
        (Question10Fun Question10)
    )
)

(check-sat)
(get-model)
(exit)