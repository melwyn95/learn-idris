module Main

data Tree elem = Empty
               | Node (Tree elem) elem (Tree elem)

insert : Ord a => a -> Tree a -> Tree a
insert x Empty = Node Empty x Empty
insert x orig@(Node left val right)
  = case compare x val of
         LT => Node (insert x left) val right
         EQ => orig
         GT => Node left val (insert x right)

fold_left : (a -> b -> b) -> b -> List a -> b
fold_left f x [] = x
fold_left f x (y :: xs) = fold_left f (f y x) xs

fold_right : (a -> b -> b) -> b -> List a -> b
fold_right f x [] = x
fold_right f x (y :: xs) = f y (fold_right f x xs)

concat2 : List a -> List a -> List a
concat2 [] ys = ys
concat2 (x :: xs) ys = x :: concat2 xs ys

concatAll: List (List a) -> List a
concatAll [] = []
concatAll (x :: xs) = concat2 x (concatAll xs)

listToTree : Ord a => List a -> Tree a
listToTree xs = fold_right insert Empty xs

treeToList : Ord a => Tree a -> List a
treeToList Empty = []
treeToList (Node left val right) = concatAll [(treeToList left), [val], (treeToList right)]
