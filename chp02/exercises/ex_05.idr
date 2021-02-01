
palindrome : Nat -> String -> Bool
palindrome n s = let s = toLower s in
                 if length s > n then s == reverse s else False
