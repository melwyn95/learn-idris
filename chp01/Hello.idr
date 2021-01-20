module Main

{-
main : IO ()
main = putStrLn "Hello, Idris World!"
-}

{-
main : IO()
main = putStrLn ?greeting
-}

main : IO()
main = putStrLn (cast 'x')
