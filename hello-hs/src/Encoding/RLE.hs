module Encoding.RLE where

import           Control.Category ((<<<))
import           Data.List        (List (Nil), map, (<|))
import           Data.List        (replicate)
import           Data.List        (concatMap)
import           Data.NonEmpty    (group, head, length)
import           Prelude          (Char, Eq, Int, fst, snd, uncurry)

type RLE a = List (Int, a)

rle :: Eq a => List a -> RLE a
rle = map (\list -> (length list, head list)) <<< group

-- >>> rle "aaaabbccc"
-- [(4,'a'), (2,'b'), (3,'c')]

unrle :: RLE a -> List a
unrle = concatMap (uncurry replicate)

-- >>> unrle ((2,'a') <| (3, 'b') <| Nil)
-- ['a', 'a', 'b', 'b', 'b']
