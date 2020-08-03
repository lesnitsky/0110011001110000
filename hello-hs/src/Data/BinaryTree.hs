module Data.BinaryTree where

import           Data.Bool (Bool (False, True))
import           Prelude   (Eq, Int, Show, (*), (+))

data Tree a
  = Empty
  | Leaf a
  | Node a (Tree a) (Tree a)
  deriving (Show, Eq)

t :: Tree Int
t = Node 1 (Node 2 (Leaf 3) (Leaf 4)) Empty

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

fold :: a -> (a -> a -> a) -> Tree a -> a
fold d _ Empty               = d
fold _ _ (Leaf v)            = v
fold d f (Node v left right) = f (f v (fold d f left)) (fold d f right)

sum :: Tree Int -> Int
sum = fold 0 (+)

-- >>> Data.BinaryTree.sum Empty
-- 0

-- >>> Data.BinaryTree.sum t
-- 6

product :: Tree Int -> Int
product = fold 1 (*)

-- >>> Data.BinaryTree.product Empty
-- 1

-- >>> Data.BinaryTree.product t
-- 24
