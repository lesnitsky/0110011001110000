module Data.Temperature where

import           Base.Sugar (($))
import           Prelude    (Bool, Double, Eq ((==)), Show (show), (*), (+),
                             (++))

instance Show Temperature where
  show (Celsius t)    = (show t) ++ "°C"
  show (Fahrenheit t) = (show t) ++ "°F"

data Temperature
  = Celsius Double
  | Fahrenheit Double

instance Eq Temperature where
    (==) :: Temperature -> Temperature -> Bool
    (==) c@(Celsius _) f@(Fahrenheit _)  = ctof c == f
    (==) (Celsius c1) (Celsius c2)       = c1 == c2
    (==) (Fahrenheit f1) (Fahrenheit f2) = f1 == f2
    (==) f@(Fahrenheit _) c@(Celsius _)  = ctof c == f

ctof :: Temperature -> Temperature
ctof (Celsius t) = Fahrenheit $ t * 1.8 + 32
ctof t           = t
