module Main

import ex_03

-- main : IO ()
-- main = repl "Enter a string: " (\s => show (palindrome s) ++ "\n")

main : IO ()
main = repl "Enter a string: " show_palindrome
  where
    show_palindrome : String -> String
    show_palindrome s = show (palindrome s) ++ "\n"
