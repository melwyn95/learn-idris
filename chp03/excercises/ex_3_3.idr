import Data.Vect

createEmpties : Vect n (Vect 0 elem)
createEmpties = replicate _ []

transposeMat : Vect m (Vect n elem) -> Vect n (Vect m elem)
transposeMat [] = createEmpties
transposeMat (x :: xs) = let xTrans = transposeMat xs in
                         zipWith (::) x xTrans

addMatrix : Num a => Vect n (Vect m a) -> Vect n (Vect m a) -> Vect n (Vect m a)
addMatrix [] [] = []
addMatrix (x :: xs) (y ::ys) = zipWith (+) x y :: addMatrix xs ys

combine : Num a => (xs : Vect m a) -> Vect m a -> a
combine xs ys = sum (zipWith (*) xs ys)

multHelper : Num a => (yTrans : Vect p (Vect m a)) -> Vect m a -> Vect p a
multHelper yTrans xs = map (combine xs) yTrans

multMatrix : Num a => Vect n (Vect m a) -> Vect m (Vect p a) -> Vect n (Vect p a)
multMatrix xs ys = let yTans = transposeMat ys in
                   map(multHelper yTans) xs


multiplyRow : Num a => (x : Vect m a) -> (yTrans : Vect p (Vect m a)) -> Vect p a
multiplyRow x [] = []
multiplyRow x (y :: ys) = sum (zipWith (*) x y) :: multiplyRow x ys

mapRow : Num a => (xs : Vect n (Vect m a)) -> (yTrans : Vect p (Vect m a)) -> Vect n (Vect p a)
mapRow [] yTrans = []
mapRow (x :: xs) yTrans = multiplyRow x yTrans :: mapRow xs yTrans

multMatrix' : Num a => Vect n (Vect m a) -> Vect m (Vect p a) -> Vect n (Vect p a)
multMatrix' [] ys = []
multMatrix' xs ys = let yTrans = transposeMat ys in
                  mapRow xs yTrans
