import Data.Vect

readVect : IO (len ** Vect len String)
readVect = do x <- getLine
              if x == ""
                then pure (_ ** [])
                else do (_ ** xs) <- readVect
                        pure (_ ** x :: xs)

zipInputs : IO ()
zipInputs = do putStrLn "Enter first vector (blank line to end): "
               (n1 ** xs) <- readVect
               putStrLn "Enter first vector (blank line to end): "
               (n2 ** ys) <- readVect
               case exactLength n1 ys of
                     Nothing => putStrLn "Vectors are different lengths"
                     Just ys' => printLn (zip xs ys')
