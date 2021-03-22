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
             | Search String
             | Quit
             | Size

parseCommand : (cmd : String) -> (args : String) -> Maybe Command
parseCommand "add" str = Just (Add str)
parseCommand "get" val = case all isDigit (unpack val) of
                               False => Nothing
                               True => Just (Get (cast val))
parseCommand "search" str = Just (Search str)
parseCommand "quit" "" = Just Quit
parseCommand "size" "" = Just Size
parseCommand _ args = Nothing

parse : (input : String) -> Maybe Command
parse input = case Strings.span (/= ' ') input of
                   (cmd, args) => parseCommand cmd (ltrim args)

getEntry : (pos : Integer) -> (store : DataStore) -> Maybe (String, DataStore)
getEntry pos store = let store_items = items store in
                            (case integerToFin pos (size store) of
                                  Nothing => Just ("Out of range\n", store)
                                  (Just id) => Just (index id store_items ++ "\n", store))

findEntry : (str : String) -> (store : DataStore) -> Maybe (String, DataStore)
findEntry str store = let store_items = items store in
                      Just (keepEntries str store_items, store)
    where
      keepEntries : (str : String) -> (store_items : Vect size String) -> String
      keepEntries {size = Z} s [] = ""
      keepEntries {size = (S k)} s (item::items) = case Strings.isInfixOf s item of
                                             False => keepEntries s items
                                             True => show (toIntegerNat (size store) - toIntegerNat (S k))
                                                      ++ ": " ++ item ++ "\n"++ keepEntries s items


processInput : DataStore -> String -> Maybe (String, DataStore)
processInput store inp
  = case parse inp of
         Nothing => Just ("Invalid Command\n", store)
         (Just (Add str)) =>
            Just ("ID " ++ show (size store) ++ "\n", addToStore store str)
         (Just (Get pos)) => getEntry pos store
         (Just (Search str)) => findEntry str store
         (Just Size) => Just (show (size store) ++ "\n", store)
         (Just Quit) => Nothing

main : IO ()
main = replWith (MkData _ []) "Command: "processInput
