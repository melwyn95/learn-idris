module Main

||| Represents shapes
public export
data Shape = ||| A triangle, with its base length and height
             Triangle Double Double
           | ||| A Rectangle, with its length and height
             Rectangle Double Double
           | ||| A circile, with its radius
             Circle Double

export
area : Shape -> Double
area (Triangle base height) = 0.5 * base * height
area (Rectangle length height) = length * height
area (Circle radius) = pi * radius * radius

data Shape' : Type where
     Triangle' : Double -> Double -> Shape'
     Rectangle' : Double -> Double -> Shape'
     Circle' : Double -> Shape'
