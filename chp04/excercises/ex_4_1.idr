module Main

public export
data Shape = Triangle Double Double
           | Rectangle Double Double
           | Circle Double

area : Shape -> Double
area (Triangle base height) = 0.5 * base * height
area (Rectangle length height) = length * height
area (Circle radius) = pi * radius * radius

data Picture = Primitive Shape
            | Combine Picture Picture
            | Rotate Double Picture
            | Translate Double Double Picture

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

data Expr = Val Int
          | Add Expr Expr
          | Sub Expr Expr
          | Mult Expr Expr

evaluate : Expr -> Int
evaluate (Val v) = v
evaluate (Add e1 e2) = evaluate e1 + evaluate e2
evaluate (Sub e1 e2) = evaluate e1 - evaluate e2
evaluate (Mult e1 e2) = evaluate e1 * evaluate e2

maxMaybe : Ord a => Maybe a -> Maybe a -> Maybe a
maxMaybe Nothing y = y
maxMaybe p1@(Just x) Nothing = p1
maxMaybe (Just x) (Just y)
  = if x > y then Just x
             else Just y

testPic1 : Picture
testPic1 = Combine (Primitive (Triangle 2 3))
                   (Primitive (Triangle 2 4))

testPic2 : Picture
testPic2 = Combine (Primitive (Rectangle 1 3))
                   (Primitive (Circle 4))

isTriangle : (x : Shape) -> Bool
isTriangle (Triangle x y) = True
isTriangle (Rectangle x y) = False
isTriangle (Circle x) = False

biggestTriangle : Picture -> Maybe Double
biggestTriangle (Primitive x) = if isTriangle x then Just (area x) else Nothing
biggestTriangle (Combine x y) = maxMaybe (biggestTriangle x) (biggestTriangle y)
biggestTriangle (Rotate _ x) = biggestTriangle x
biggestTriangle (Translate _ _ x) =? biggestTriangle x
