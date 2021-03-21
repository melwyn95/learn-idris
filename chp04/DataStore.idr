module Main

import Data.Vect

data DataStore : Type where
  MkData : (size : Nat) ->
           (items : Vect size String) ->
           DataStore

size : DataStore -> Nat
size (MkData size' items) = size'

items : (store : DataStore) -> Vect (size store) String
items (MkData size items') = items'

addToStore : DataStore -> String -> DataStore
addToStore (MkData size items) newItem = MkData _ (addToData items)
  where
    addToData : Vect old String -> Vect (S old) String
    addToData [] = [newItem]
    addToData (x :: xs) = x :: addToData xs

data Command = Add String
             | Get Integer
             | Quit

parseCommand : (cmd : String) -> (args : String) -> Maybe Command
parseCommand "add" str = Just (Add str)
parseCommand "get" val = case all isDigit (unpack val) of
                               False => Nothing
                               True => Just (Get (cast val))
parseCommand "quit" "" = Just Quit
parseCommand _ args = Nothing

parse : (input : String) -> Maybe Command
parse input = case Strings.span (/= ' ') input of
                   (cmd, args) => parseCommand cmd (ltrim args)

processInput : DataStore -> String -> Maybe (String, DataStore)
processInput store inp
  = case parse inp of
         Nothing => Just ("Invalid Command\n", store)
         (Just cmd) => ?processCommand

main : IO ()
main = replWith (MkData _ []) "Command: "processInput
