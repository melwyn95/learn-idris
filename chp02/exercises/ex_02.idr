
palindrome : String -> Bool
palindrome s = s == reverse s

{-
*ex_02> palindrome "racecar"
True : Bool
*ex_02> palindrome "race car"
False : Bool
-}
