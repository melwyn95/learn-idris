{-
Idris> (94, "Pages")
(94, "Pages") : (Integer, String)
Idris> :let pair = (94, "Pages")
Idris> fst pair
94 : Integer
Idris> snd pair
"Pages" : String
Idris> :t fst
Prelude.Basics.fst : (a, b) -> a
Prelude.Pairs.DPair.fst : DPair a P -> a
Idris> :t snd
Prelude.Basics.snd : (a, b) -> b
Prelude.Pairs.DPair.snd : (x : DPair a P) -> P (fst x)

Idris> ('x', 8, String)
('x', 8, String) : (Char, Integer, Type)
Idris> ()
() : ()

Idris> (('x', 8), (String, 'y', 100), "Hello")
(('x', 8), (String, 'y', 100), "Hello") : ((Char, Integer),
                                           (Type, Char, Integer),
                                           String)

Idris> (1, (2, (3, 4)))
(1, 2, 3, 4) : (Integer, Integer, Integer, Integer)

Idris> [1, 2, 3, 4]
[1, 2, 3, 4] : List Integer
Idris> ["One", "Two", "Three", "Four"]
["One", "Two", "Three", "Four"] : List String

Idris> []
(input):Can't infer argument elem to []
Idris> the (List Int) []
[] : List Int
Idris> [1, 2, 3] ++ [1, 2, 3]
[1, 2, 3, 1, 2, 3] : List Integer
Idris> 1::[2, 3, 4]
[1, 2, 3, 4] : List Integer
Idris> 1::2::3::4::[]
[1, 2, 3, 4] : List Integer

Idris> [1..5]
[1, 2, 3, 4, 5] : List Integer
Idris> [1, 3..9]
[1, 3, 5, 7, 9] : List Integer
Idris> [5, 4..1]
[5, 4, 3, 2, 1] : List Integer
Idris> [5..1]
[5, 4, 3, 2, 1] : List Integer
-}
