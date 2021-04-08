

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
  let Just (output, newstate) = onInput state input
    | Nothing => pure ()
  putStr output
  replWith' newstate prompt onInput
