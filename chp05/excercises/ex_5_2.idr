

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
