
counts : String -> (Nat, Nat)
counts s = (length (words s), length (unpack s))
