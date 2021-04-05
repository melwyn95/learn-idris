
printLength : IO ()
printLength = getLine >>= \input => let len = length input in
                                      putStrLn (show len)

printLength' : IO ()
printLength' = putStr "Input String: " >>= \_ =>
               getLine >>= \input =>
               let len = length input in
               putStrLn (show len)

printTwoThings : IO ()
printTwoThings = do putStrLn "Hello"
                    putStrLn "World"

printInput : IO ()
printInput = do x <- getLine
                putStrLn x

doPrintLength : IO ()
doPrintLength = do putStr "Input string: "
                   input <- getLine
                   let len = show (length input)
                   putStrLn len
