module Data.Tuple where

import           Prelude (Int, String)
data Tuple a b = Tuple a b

tuple :: a -> b -> Tuple a b
tuple = Tuple

t :: Tuple Int String
t = tuple 1 "abc"

fst :: Tuple a b -> a
fst (Tuple a _) = a
-- >>> Data.Tuple.fst t
-- 1

snd :: Tuple a b -> b
snd (Tuple _ b) = b
-- >>> Data.Tuple.snd t
-- "abc"
