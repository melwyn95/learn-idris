twice : (a -> a) -> a -> a
twice f x = f (f x)

Shape : Type
rotate : Shape -> Shape

double : Num a => a -> a
double x = x + x

quadruple : Num a => a -> a
quadruple = twice double

turn_around : Shape -> Shape
turn_around = twice rotate

add : Int -> Int -> Int
add a b = a + b

-- Anonymous function
{-
*HOF> twice (\x => x * x) 2
16 : Integer
*HOF> :t \x => x * x
\x => x * x : Integer -> Integer
-}
