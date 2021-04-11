import Data.Vect

readToBlank : IO (List String)
readToBlank = do x <- getLine
                 if x == ""
                   then pure []
                   else do xs <- readToBlank
                           pure (x :: xs)

listToString : List String -> String
listToString [] = ""
listToString (x :: xs) = x ++ "\n" ++ (listToString xs)

readAndSave : IO ()
readAndSave
  = do putStr "Enter lines (blank line to end): "
       xs <- readToBlank
       putStr "Enter file name: "
       filename <- getLine
       let xs = listToString xs
       Right _ <- writeFile filename xs
        | Left err => printLn err
       pure ()

readVectFile : (filename : String) -> IO (n ** Vect n String)
readVectFile filename
  = do Right f <- openFile filename Read
          | Left err => pure (_ ** [])
       Right (n ** xs) <- readContents f
          | Left err => pure (_ ** [])
       closeFile f
       pure (n ** xs)
  where
    readContents : File -> IO (Either FileError (n ** Vect n String))
    readContents f = do iseof <- fEOF f
                        case iseof of
                          False => do Right line <- fGetLine f
                                        | Left err => pure (Left err)
                                      Right (_ ** lines) <- readContents f
                                        | Left err => pure (Left err)
                                      pure (Right (_ ** (line :: lines)))
                          True => pure (Right (_ ** []))
