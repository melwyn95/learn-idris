
palindrome : String -> Bool
palindrome s = let s = toLower s in
                if length s > 10 then s == reverse s else False
