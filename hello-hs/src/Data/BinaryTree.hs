module Data.BinaryTree where

import           Data.Bool (Bool (False, True))
import           Prelude   (Eq, Int, Show, (+))

data Tree a
  = Empty
  | Leaf a
  | Node a (Tree a) (Tree a)
  deriving (Show, Eq)

t :: Tree Int
t = Node 0 (Node 1 (Leaf 2) (Leaf 3)) Empty

lengthT :: Tree a -> Int
lengthT Empty               = 0
lengthT (Leaf _)            = 1
lengthT (Node _ left right) = 1 + lengthT left + lengthT right

-- >>> lengthT t
-- 4

-- >>> lengthT Empty
-- 0

isEmpty :: Tree a -> Bool
isEmpty Empty = True
isEmpty _     = False

-- >>> isEmpty t
-- False

-- >>> isEmpty Empty
-- True