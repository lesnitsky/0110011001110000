module Data.List where

import           Data.Maybe (Maybe (Nothing))
import           Data.Maybe (Maybe (Just))
import           Prelude    (Bool (..), Eq, Int, Show (show), String, fst,
                             otherwise, snd, (*), (+), (++), (==), (||))

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

-- >>> Data.List.head (1 <| 2 <| 3 <| Nil)
-- Just 1

group :: Eq a => List a -> List (List a)
group Nil        = Nil
group (Cons h t) = let (s, t') = span (\x -> x == h) t in (h <| s) <| group t'

-- >>> Data.List.group (1 <| 1 <| 2 <| 1 <| 3 <| 3 <| 2 <| Nil)
-- [[1, 1], [2], [1], [3, 3], [2]]

map :: (a -> b) -> List a -> List b
map _ Nil        = Nil
map f (Cons h t) = f h <| map f t

span :: (a -> Bool) -> List a -> (List a, List a)
span = _span (Nil, Nil)
  where
    _span :: (List a, List a) -> (a -> Bool) -> List a -> (List a, List a)
    _span t _ Nil                       = t
    _span t f l@(Cons h _t) | f h       = _span (h <| fst t, snd t) f _t
                            | otherwise = (fst t, l)

-- TODO: fix order
-- >>> Data.List.span (< 5) (1 <| 2 <| 7 <| 9 <| 4 <| 1 <| Nil)
-- ([2, 1],[7, 9, 4, 1])

sum :: List Int -> Int
sum Nil        = 0
sum (Cons h t) = h + sum t

-- >>> Data.List.sum (1 <| 2 <| 3 <| Nil)
-- 6

product :: List Int -> Int
product Nil        = 1
product (Cons h t) = h * (product t)

-- >>> Data.List.product (1 <| 2 <| 3 <| 4 <| Nil)
-- 24

tail :: List a -> Maybe (List a)
tail Nil          = Nothing
tail (Cons _ Nil) = Just Nil
tail (Cons _ t)   = Just t

-- >>> Data.List.tail (1 <| 2 <| 3 <| 4 <| Nil)
-- Just [2, 3, 4]

-- >>> Data.List.tail (1 <| Nil)
-- Nothing

last :: List a -> Maybe a
last Nil          = Nothing
last (Cons h Nil) = Just h
last (Cons _ t)   = last t

-- >>> Data.List.last (1 <| 2 <| 3 <| 4 <| Nil)
-- Just 4

-- >>> Data.List.last (1 <| Nil)
-- Just 1

init :: List a -> Maybe (List a)
init Nil          = Nothing
init (Cons _ Nil) = Just Nil
init (Cons h t)   = case init t of
  Just l  -> Just (Cons h l)
  Nothing -> Just (Cons h Nil)

-- >>> Data.List.init (1 <| 2 <| 3 <| Nil)
-- Just [1, 2]

-- >>> Data.List.init (1 <| Nil)
-- Nothing
