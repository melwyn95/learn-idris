
printLength : IO ()
printLength = getLine >>= \input => let len = length input in
                                      putStrLn (show len)

printLength' : IO ()
printLength' = putStr "Input String: " >>= \_ =>
               getLine >>= \input =>
               let len = length input in
               putStrLn (show len)
