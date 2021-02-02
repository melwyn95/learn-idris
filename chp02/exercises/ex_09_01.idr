module Main

import ex_06

main : IO ()
main = repl "Enter a string: " (\s => show (counts s) ++ "\n")
