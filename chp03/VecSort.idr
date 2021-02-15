import Data.Vect

insert : Ord elem =>
         (x : elem) -> (xsSorted : Vect n elem) -> Vect (S n) elem
insert x [] = [x]
insert x (y :: xs) = case x < y of
                        False => y :: insert x xs
                        True => x :: y :: xs


insSort : Ord elem => Vect n elem -> Vect n elem
insSort [] = []
insSort (x :: xs) = let xsSorted = insSort xs in
                      insert x xsSorted
