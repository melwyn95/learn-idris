
over_length : Nat -> List String -> Nat
over_length n xs = length (filter (\x => (length x) > n) xs)
