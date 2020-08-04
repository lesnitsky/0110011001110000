module Data.BinaryTree where

import           Data.Bool (Bool (False, True))
import           Prelude   (Eq, Int, Show (show), String, (*), (+), (++), (.))

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

fold :: (b -> a -> b) -> b -> Tree a -> b
fold _ d Empty               = d
fold f d (Leaf v)            = f d v
fold f d (Node v left right) = fold f (fold f (f d v) left) right

sum :: Tree Int -> Int
sum = fold (+) 0

str :: Show a => String -> a -> String
str p = (p ++) . show

-- >>> fold str "" t
-- "1234"

-- >>> Data.BinaryTree.sum Empty
-- 0

-- >>> Data.BinaryTree.sum t
-- 10

product :: Tree Int -> Int
product = fold (*) 1

-- >>> Data.BinaryTree.product Empty
-- 1

-- >>> Data.BinaryTree.product t
-- 24
