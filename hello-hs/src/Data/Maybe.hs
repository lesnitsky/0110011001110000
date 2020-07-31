module Data.Maybe where

import           Prelude (Show)

data Maybe a
  = Nothing
  | Just a
  deriving (Show)

maybe :: b -> (a -> b) -> Maybe a -> b
maybe f _ Nothing  = f
maybe _ f (Just a) = f a

-- >>> Data.Maybe.maybe 0 (+1) Data.Maybe.Nothing
-- 0

-- >>> Data.Maybe.maybe "" show (Data.Maybe.Just 5)
-- "5"

fromMaybe :: a -> Maybe a -> a
fromMaybe f Nothing  = f
fromMaybe _ (Just a) = a

-- >>> Data.Maybe.fromMaybe 0 Data.Maybe.Nothing
-- 0

-- >>> Data.Maybe.fromMaybe 0 (Data.Maybe.Just 5)
-- 5
