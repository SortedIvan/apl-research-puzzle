; declare fields
(declare-fun a11 () Int)
(declare-fun a12 () Int)
(declare-fun a13 () Int)
(declare-fun a14 () Int)
(declare-fun a15 () Int)
(declare-fun a16 () Int)
(declare-fun a17 () Int)
(declare-fun a18 () Int)
(declare-fun a19 () Int)
(declare-fun a21 () Int)
(declare-fun a22 () Int)
(declare-fun a23 () Int)
(declare-fun a24 () Int)
(declare-fun a25 () Int)
(declare-fun a26 () Int)
(declare-fun a27 () Int)
(declare-fun a28 () Int)
(declare-fun a29 () Int)
(declare-fun a31 () Int)
(declare-fun a32 () Int)
(declare-fun a33 () Int)
(declare-fun a34 () Int)
(declare-fun a35 () Int)
(declare-fun a36 () Int)
(declare-fun a37 () Int)
(declare-fun a38 () Int)
(declare-fun a39 () Int)
(declare-fun a41 () Int)
(declare-fun a42 () Int)
(declare-fun a43 () Int)
(declare-fun a44 () Int)
(declare-fun a45 () Int)
(declare-fun a46 () Int)
(declare-fun a47 () Int)
(declare-fun a48 () Int)
(declare-fun a49 () Int)
(declare-fun a51 () Int)
(declare-fun a52 () Int)
(declare-fun a53 () Int)
(declare-fun a54 () Int)
(declare-fun a55 () Int)
(declare-fun a56 () Int)
(declare-fun a57 () Int)
(declare-fun a58 () Int)
(declare-fun a59 () Int)
(declare-fun a61 () Int)
(declare-fun a62 () Int)
(declare-fun a63 () Int)
(declare-fun a64 () Int)
(declare-fun a65 () Int)
(declare-fun a66 () Int)
(declare-fun a67 () Int)
(declare-fun a68 () Int)
(declare-fun a69 () Int)
(declare-fun a71 () Int)
(declare-fun a72 () Int)
(declare-fun a73 () Int)
(declare-fun a74 () Int)
(declare-fun a75 () Int)
(declare-fun a76 () Int)
(declare-fun a77 () Int)
(declare-fun a78 () Int)
(declare-fun a79 () Int)
(declare-fun a81 () Int)
(declare-fun a82 () Int)
(declare-fun a83 () Int)
(declare-fun a84 () Int)
(declare-fun a85 () Int)
(declare-fun a86 () Int)
(declare-fun a87 () Int)
(declare-fun a88 () Int)
(declare-fun a89 () Int)
(declare-fun a91 () Int)
(declare-fun a92 () Int)
(declare-fun a93 () Int)
(declare-fun a94 () Int)
(declare-fun a95 () Int)
(declare-fun a96 () Int)
(declare-fun a97 () Int)
(declare-fun a98 () Int)
(declare-fun a99 () Int)

; unique per row
(assert (distinct a11 a12 a13 a14 a15 a16 a17 a18 a19))
(assert (distinct a21 a22 a23 a24 a25 a26 a27 a28 a29))
(assert (distinct a31 a32 a33 a34 a35 a36 a37 a38 a39))
(assert (distinct a41 a42 a43 a44 a45 a46 a47 a48 a49))
(assert (distinct a51 a52 a53 a54 a55 a56 a57 a58 a59))
(assert (distinct a61 a62 a63 a64 a65 a66 a67 a68 a69))
(assert (distinct a71 a72 a73 a74 a75 a76 a77 a78 a79))
(assert (distinct a81 a82 a83 a84 a85 a86 a87 a88 a89))
(assert (distinct a91 a92 a93 a94 a95 a96 a97 a98 a99))

; unique per column
(assert (distinct a11 a21 a31 a41 a51 a61 a71 a81 a91))
(assert (distinct a12 a22 a32 a42 a52 a62 a72 a82 a92))
(assert (distinct a13 a23 a33 a43 a53 a63 a73 a83 a93))
(assert (distinct a14 a24 a34 a44 a54 a64 a74 a84 a94))
(assert (distinct a15 a25 a35 a45 a55 a65 a75 a85 a95))
(assert (distinct a16 a26 a36 a46 a56 a66 a76 a86 a96))
(assert (distinct a17 a27 a37 a47 a57 a67 a77 a87 a97))
(assert (distinct a18 a28 a38 a48 a58 a68 a78 a88 a98))
(assert (distinct a19 a29 a39 a49 a59 a69 a79 a89 a99))

; limit to 1..9
(assert (and (>= a11 1) (<= a11 9)))
(assert (and (>= a12 1) (<= a12 9)))
(assert (and (>= a13 1) (<= a13 9)))
(assert (and (>= a14 1) (<= a14 9)))
(assert (and (>= a15 1) (<= a15 9)))
(assert (and (>= a16 1) (<= a16 9)))
(assert (and (>= a17 1) (<= a17 9)))
(assert (and (>= a18 1) (<= a18 9)))
(assert (and (>= a19 1) (<= a19 9)))
(assert (and (>= a21 1) (<= a21 9)))
(assert (and (>= a22 1) (<= a22 9)))
(assert (and (>= a23 1) (<= a23 9)))
(assert (and (>= a24 1) (<= a24 9)))
(assert (and (>= a25 1) (<= a25 9)))
(assert (and (>= a26 1) (<= a26 9)))
(assert (and (>= a27 1) (<= a27 9)))
(assert (and (>= a28 1) (<= a28 9)))
(assert (and (>= a29 1) (<= a29 9)))
(assert (and (>= a31 1) (<= a31 9)))
(assert (and (>= a32 1) (<= a32 9)))
(assert (and (>= a33 1) (<= a33 9)))
(assert (and (>= a34 1) (<= a34 9)))
(assert (and (>= a35 1) (<= a35 9)))
(assert (and (>= a36 1) (<= a36 9)))
(assert (and (>= a37 1) (<= a37 9)))
(assert (and (>= a38 1) (<= a38 9)))
(assert (and (>= a39 1) (<= a39 9)))
(assert (and (>= a41 1) (<= a41 9)))
(assert (and (>= a42 1) (<= a42 9)))
(assert (and (>= a43 1) (<= a43 9)))
(assert (and (>= a44 1) (<= a44 9)))
(assert (and (>= a45 1) (<= a45 9)))
(assert (and (>= a46 1) (<= a46 9)))
(assert (and (>= a47 1) (<= a47 9)))
(assert (and (>= a48 1) (<= a48 9)))
(assert (and (>= a49 1) (<= a49 9)))
(assert (and (>= a51 1) (<= a51 9)))
(assert (and (>= a52 1) (<= a52 9)))
(assert (and (>= a53 1) (<= a53 9)))
(assert (and (>= a54 1) (<= a54 9)))
(assert (and (>= a55 1) (<= a55 9)))
(assert (and (>= a56 1) (<= a56 9)))
(assert (and (>= a57 1) (<= a57 9)))
(assert (and (>= a58 1) (<= a58 9)))
(assert (and (>= a59 1) (<= a59 9)))
(assert (and (>= a61 1) (<= a61 9)))
(assert (and (>= a62 1) (<= a62 9)))
(assert (and (>= a63 1) (<= a63 9)))
(assert (and (>= a64 1) (<= a64 9)))
(assert (and (>= a65 1) (<= a65 9)))
(assert (and (>= a66 1) (<= a66 9)))
(assert (and (>= a67 1) (<= a67 9)))
(assert (and (>= a68 1) (<= a68 9)))
(assert (and (>= a69 1) (<= a69 9)))
(assert (and (>= a71 1) (<= a71 9)))
(assert (and (>= a72 1) (<= a72 9)))
(assert (and (>= a73 1) (<= a73 9)))
(assert (and (>= a74 1) (<= a74 9)))
(assert (and (>= a75 1) (<= a75 9)))
(assert (and (>= a76 1) (<= a76 9)))
(assert (and (>= a77 1) (<= a77 9)))
(assert (and (>= a78 1) (<= a78 9)))
(assert (and (>= a79 1) (<= a79 9)))
(assert (and (>= a81 1) (<= a81 9)))
(assert (and (>= a82 1) (<= a82 9)))
(assert (and (>= a83 1) (<= a83 9)))
(assert (and (>= a84 1) (<= a84 9)))
(assert (and (>= a85 1) (<= a85 9)))
(assert (and (>= a86 1) (<= a86 9)))
(assert (and (>= a87 1) (<= a87 9)))
(assert (and (>= a88 1) (<= a88 9)))
(assert (and (>= a89 1) (<= a89 9)))
(assert (and (>= a91 1) (<= a91 9)))
(assert (and (>= a92 1) (<= a92 9)))
(assert (and (>= a93 1) (<= a93 9)))
(assert (and (>= a94 1) (<= a94 9)))
(assert (and (>= a95 1) (<= a95 9)))
(assert (and (>= a96 1) (<= a96 9)))
(assert (and (>= a97 1) (<= a97 9)))
(assert (and (>= a98 1) (<= a98 9)))
(assert (and (>= a99 1) (<= a99 9)))

; unique per box
(assert (distinct a11 a12 a13 a21 a22 a23 a31 a32 a33))
(assert (distinct a14 a15 a16 a24 a25 a26 a34 a35 a36))
(assert (distinct a17 a18 a19 a27 a28 a29 a37 a38 a39))
(assert (distinct a41 a42 a43 a51 a52 a53 a61 a62 a63))
(assert (distinct a44 a45 a46 a54 a55 a56 a64 a65 a66))
(assert (distinct a47 a48 a49 a57 a58 a59 a67 a68 a69))
(assert (distinct a71 a72 a73 a81 a82 a83 a91 a92 a93))
(assert (distinct a74 a75 a76 a84 a85 a86 a94 a95 a96))
(assert (distinct a77 a78 a79 a87 a88 a89 a97 a98 a99))

; instance to solve
(assert (= a17 8))
(assert (= a21 4))
(assert (= a24 2))
(assert (= a25 8))
(assert (= a29 6))
(assert (= a36 7))
(assert (= a38 3))
(assert (= a43 6))
(assert (= a46 3))
(assert (= a48 2))
(assert (= a49 1))
(assert (= a51 5))
(assert (= a52 4))
(assert (= a55 1))
(assert (= a58 7))
(assert (= a59 8))
(assert (= a61 1))
(assert (= a62 2))
(assert (= a64 5))
(assert (= a67 6))
(assert (= a72 7))
(assert (= a74 3))
(assert (= a81 3))
(assert (= a85 6))
(assert (= a86 1))
(assert (= a89 4))
(assert (= a93 5))

; ***********
; * 4  51 3 *
; *    427  *
; *   6    5*
; * 2   53  *
; * 8  1  6 *
; *  73   1 *
; *8    6   *
; *  327    *
; * 6 18  4 *
; ***********

; solving...
(check-sat)
(get-model)