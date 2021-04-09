import System

{- 3 -}
readNumber : IO (Maybe Nat)
readNumber = do
  input <- getLine
  if all isDigit (unpack input)
    then pure (Just (cast input))
    else pure (Nothing)

guess : (target : Nat) -> (guesses : Nat) -> IO ()
guess target guesses = do
  putStrLn (show guesses ++ " guesses so far")
  putStr "Guess a number between 1 and 100: "
  num <- readNumber
  case num of
        Nothing => do
          putStrLn "Invalid input"
          guess target (guesses + 1)
        Just g =>
          case compare g target of
            LT => do
                    putStrLn "Too low"
                    guess target (guesses + 1)
            EQ => putStrLn "Well done"
            GT => do
                    putStrLn "Too high"
                    guess target (guesses + 1)

main : IO ()
main = do
  t <- time
  let target = cast (mod t 101)
  guess target 0
