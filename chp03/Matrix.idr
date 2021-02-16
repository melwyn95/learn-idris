import Data.Vect

createEmpties : Vect n (Vect 0 elem)
createEmpties = replicate _ []

transposeHelper : (x : Vect n elem) -> (xTrans : Vect n (Vect len elem)) -> Vect n (Vect (S len) elem)
transposeHelper = zipWith (::)

transposeMat : Vect m (Vect n elem) -> Vect n (Vect m elem)
transposeMat [] = createEmpties
transposeMat (x :: xs) = let xTrans = transposeMat xs in
                        transposeHelper x xTrans
