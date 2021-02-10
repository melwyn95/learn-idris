import Data.Vect

{-
*WordLength_vec> the (List String) ["Hello", "There"]
["Hello", "There"] : List String
*WordLength_vec> the (List _) ["Hello", "There"]
["Hello", "There"] : List String
*WordLength_vec> the (Vect _ _) ["Hello", "There"]
["Hello", "There"] : Vect 2 String
*WordLength_vec> the (Vect 5 _) ["Hello", "There"]
-}

total allLengths : Vect n String -> Vect n Nat
allLengths [] = []
allLengths (word :: words) = length word :: allLengths words
