import Data.Vect

{- 1, 2 -}
data PowerSource = Petrol | Pedal | Electricity

data Vehicle : PowerSource -> Type where
  Bicycle : Vehicle Pedal
  Unicycle : Vehicle Pedal
  Car : (fuel : Nat) -> Vehicle Petrol
  Bus : (fuel : Nat) -> Vehicle Petrol
  Motorcycle : (fuel : Nat) -> Vehicle Petrol
  ElectricCar : (battery : Nat) -> Vehicle Electricity
  Tram : Vehicle Electricity

total wheels : Vehicle power -> Nat
wheels Bicycle = 2
wheels Unicycle = 1
wheels (Car fuel) = 4
wheels (Bus fuel) = 4
wheels (Motorcycle fuel) = 4
wheels (ElectricCar battery) = 4
wheels Tram = 8

total refuel : Vehicle Petrol -> Vehicle Petrol
refuel (Car fuel) = Car 200
refuel (Bus fuel) = Bus 400
refuel (Motorcycle fuel) = Motorcycle 100

{- 3, 4 -}
vectTake : (n : Fin len) -> Vect len a -> Vect (finToNat n) a
vectTake FZ xs = []
vectTake (FS n) (x :: xs) = x :: vectTake n xs

vectTake' : (n : Nat) -> Vect (n + m) a -> Vect n a
vectTake' Z xs = []
vectTake' (S k) (x :: xs) = x :: vectTake' k xs

{- 5 -}
sumEntries : Num a => (pos : Integer) -> Vect n a -> Vect n a -> Maybe a
sumEntries {n} pos xs ys
  = case integerToFin pos n of
      Nothing => Nothing
      (Just pos) => Just ((index pos xs) + (index pos ys))
