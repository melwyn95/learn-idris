
readNumber : IO (Maybe Nat)
readNumber = do
  input <- getLine
  if all isDigit (unpack input)
    then pure (Just (cast input))
    else pure Nothing

readNumbersNaive : IO (Maybe (Nat, Nat))
readNumbersNaive = do
  num1 <- readNumber
  (case num1 of
        Nothing => pure Nothing
        (Just x) => do
          num2 <- readNumber
          (case num2 of
                Nothing => pure Nothing
                (Just y) => pure (Just (x, y))))

readPair : IO (String, String)
readPair = do
  s1 <- getLine
  s2 <- getLine
  pure (s1, s2)

usePairNaive : IO ()
usePairNaive = do
  pair <- readPair
  (case pair of
        (a, b) => putStrLn ("You entered " ++ a ++ " and " ++ b))

usePair : IO ()
usePair = do
  (s1, s2) <- readPair
  putStrLn ("You entered " ++ s1 ++ " and " ++ s2)

readNumbers : IO (Maybe (Nat, Nat))
readNumbers = do
  Just n1 <- readNumber | Nothing => pure Nothing
  Just n2 <- readNumber | Nothing => pure Nothing
  pure (Just (n1, n2))
