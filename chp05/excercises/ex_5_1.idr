
printLonger : IO ()
printLonger = do putStr "First string: "
                 s1 <- getLine
                 putStr "Secong string: "
                 s2 <- getLine
                 let (l1, l2) = (length s1, length s2)
                 if l1 > l2
                   then putStrLn (show l1)
                   else putStrLn (show l2)

printLonger' : IO ()
printLonger' = putStr "Fisrt string: " >>= \_ =>
               getLine >>= \s1 =>
               putStr "Second string: " >>= \_ =>
               getLine >>= \s2 =>
               let (l1, l2) = (length s1, length s2) in
               if l1 > l2
                 then putStrLn (show l1)
                 else putStrLn (show l2)
