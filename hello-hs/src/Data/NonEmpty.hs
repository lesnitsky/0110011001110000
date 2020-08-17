module Data.NonEmpty where

import           Data.List (List (..), (<|))
import qualified Data.List as L
import           Prelude   (Eq, Int, Show, (+), (==))

data NonEmpty a = a :| (List a)
  deriving (Show)

l :: NonEmpty Int
l = 1 :| (2 <| 3 <| Nil)

length :: NonEmpty a -> Int
length (_ :| t) = 1 + L.length t

-- >>> Data.NonEmpty.length l
-- 3

head :: NonEmpty a -> a
head (h :| _) = h

group :: Eq a => List a -> List (NonEmpty a)
group Nil        = Nil
group (Cons h t) = let (s, t') = L.span (\x -> x == h) t in (h :| s) <| group t'

-- >>> Data.NonEmpty.group (1 <| 1 <| 1 <| 2 <| 1 <| 3 <| 3 <| 2 <| Nil)
-- [1 :| [1, 1], 2 :| [], 1 :| [], 3 :| [3], 2 :| []]
