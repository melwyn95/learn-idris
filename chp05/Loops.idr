import System
import ReadNum

countdown : (secs : Nat) -> IO ()
countdown Z = putStrLn "Lift off!"
countdown (S secs) = do putStrLn (show (S secs))
                        usleep 1000000
                        countdown secs

countdowns : IO ()
countdowns = do putStr "Enter starting number: "
                Just startNum <- readNumber
                | Nothing => do putStrLn "Invalid input"
                                countdowns
                countdown startNum
                putStr "Another (y/n)? "
                yn <- getLine
                if yn == "y" then countdowns
                             else pure ()
