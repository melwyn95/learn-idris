
pallindrome : String -> Bool
pallindrome s = s == reverse s

{-
*ex_02> pallindrome "racecar"
True : Bool
*ex_02> pallindrome "race car"
False : Bool
-}
