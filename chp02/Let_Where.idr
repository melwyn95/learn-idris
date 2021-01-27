longer : String -> String -> Nat
longer s1 s2
  = let len1 = length s1
        len2 = length s2 in
        if len1 > len2 then len1 else len2

pythagoras : Double -> Double -> Double
pythagoras x y = sqrt (square x + square y)
  where
    square : Double -> Double
    square x = x * x
