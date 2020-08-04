module Data.List where

import           Data.Maybe (Maybe (Nothing))
import           Data.Maybe (Maybe (Just))
import           Prelude    (Bool (..), Eq, Int, Show (show), String, (+), (++),
                             (==), (||))

data List a
  = Nil
  | Cons a (List a)

l3 :: List Int
l3 = Cons 2 (Cons 1 (Cons 0 Nil))

length :: List a -> Int
length Nil        = 0
length (Cons _ l) = 1 + length l

-- >>> Data.List.length Nil
-- 0

-- >>> Data.List.length l3
-- 3

isEmpty :: List a -> Bool
isEmpty Nil = True
isEmpty _   = False

-- >>> isEmpty l3
-- False

-- >>> isEmpty Nil
-- True

instance Show a => Show (List a) where
  show :: List a -> String
  show l = "[" ++ join l ++ "]"
    where
      join :: Show a => List a -> String
      join Nil          = ""
      join (Cons h Nil) = show h
      join (Cons h t)   = show h ++ ", " ++ join t

-- >>> show l3
-- "[2, 1, 0]"

-- >>> show (Cons 1 Nil)
-- "[1]"

contains :: Eq a => a -> List a -> Bool
contains _ Nil        = False
contains a (Cons h t) = h == a || contains a t

-- >>> contains 1 (Cons 1 Nil)
-- True

-- >>> contains 2 Nil
-- False

(<|) :: a -> List a -> List a
(<|) = Cons
infixr 5 <|

-- >>> contains 1 (1 <| 2 <| Nil)
-- True

head :: List a -> Maybe a
head Nil        = Nothing
head (Cons h _) = Just h

l :: List Int
l = 1 <| 2 <| 3 <| Nil

-- >>> Data.List.head l
-- Just 1
