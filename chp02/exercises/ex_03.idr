module Main

export
palindrome : String -> Bool
palindrome s = let s = toLower s in
                s == reverse s
