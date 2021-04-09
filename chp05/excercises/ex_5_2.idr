import System

{- 4 -}
repl' : (prompt : String) -> (onInput : String -> String) -> IO ()
repl' prompt onInput = do
  putStr prompt
  input <- getLine
  putStr (onInput input)
  repl' prompt onInput

replWith' : (state : a) ->
            (prompt : String) ->
            (onInput : a -> String -> Maybe (String, a)) -> IO ()
replWith' state prompt onInput = do
  putStr prompt
  input <- getLine
  -- pattern matching + let binding
  -- let Just (output, newstate) = onInput state input
  --   | Nothing => pure ()
  -- normal case expression
  case onInput state input of
        Nothing => pure ()
        Just (output, newstate) => do
          putStr output
          replWith' newstate prompt onInput

{- 1, 2 -}
readNumber : IO (Maybe Nat)
readNumber = do
  input <- getLine
  if all isDigit (unpack input)
    then pure (Just (cast input))
    else pure (Nothing)

guess : (target : Nat) -> IO ()
guess target = do
  putStr "Guess a number between 1 and 100: "
  num <- readNumber
  case num of
        Nothing => do
          putStrLn "Invalid input"
          guess target
        Just g =>
          case compare g target of
            LT => do
                    putStrLn "Too low"
                    guess target
            EQ => putStrLn "Well done"
            GT => do
                    putStrLn "Too high"
                    guess target

main : IO ()
main = do
  t <- time
  let target = cast (mod t 101)
  guess target
