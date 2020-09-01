{-# LANGUAGE BlockArguments #-}
module Data.NonEmpty where

import           Data.List  (List (..), (<|))
import qualified Data.List  as L
import           Data.Maybe (Maybe (Just))
import           Data.Maybe (Maybe (Nothing))
import           Prelude    (Eq, Int, Show (show), String, (+), (++), (==))

data NonEmpty a = a :| (List a)

l :: NonEmpty Int
l = 1 :| (2 <| 3 <| Nil)

length :: NonEmpty a -> Int
length (_ :| t) = 1 + L.length t

-- >>> Data.NonEmpty.length l
-- 3

head :: NonEmpty a -> a
head (h :| _) = h

-- >>> Data.NonEmpty.head l
-- 1

tail :: NonEmpty a -> List a
tail (_ :| t) = t

-- >>> Data.NonEmpty.tail l
-- [2, 3]

init :: NonEmpty a -> List a
init (_ :| Nil) = Nil
init (h :| t) = Cons h case (L.init t) of
  Just t' -> t'
  Nothing -> Nil

-- >>> Data.NonEmpty.init l
-- [1, 2]

-- >>> Data.NonEmpty.init (1 :| Nil)
-- []

last :: NonEmpty a -> a
last (h :| t) = let Just t' = L.last (Cons h t) in t'

-- >>> Data.NonEmpty.last (2 :| (3 <| 4 <| Nil))
-- 4

group :: Eq a => List a -> List (NonEmpty a)
group Nil        = Nil
group (Cons h t) = let (s, t') = L.span (\x -> x == h) t in (h :| s) <| group t'

-- >>> Data.NonEmpty.group (1 <| 1 <| 1 <| 2 <| 1 <| 3 <| 3 <| 2 <| Nil)
-- [:[1, 1, 1], :[2], :[1], :[3, 3], :[2]]

join :: Show a => String -> NonEmpty a -> String
join _ (h :| Nil) = show h
join d (h :| t)   = (show h) ++ d ++ L.join d t

instance Show a => Show (NonEmpty a) where
  show :: NonEmpty a -> String
  show list = ":[" ++ join ", " list ++ "]"

-- >>> show l
-- ":[1, 2, 3]"
