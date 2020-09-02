module Encoding.RLE where

import           Control.Category ((<<<))
import           Data.List        (List (Nil), map, (<|))
import           Data.List        (replicate)
import           Data.List        (concatMap)
import           Data.NonEmpty    (group, head, length)
import           Prelude          (Char, Int, fst, snd, uncurry)

type RLE = List (Int, Char)

rle :: List Char -> RLE
rle = map (\list -> (length list, head list)) <<< group

-- >>> rle "aaaabbccc"
-- [(4,'a'), (2,'b'), (3,'c')]

unrle :: RLE -> List Char
unrle = concatMap (uncurry replicate)

-- >>> unrle ((2,'a') <| (3, 'b') <| Nil)
-- ['a', 'a', 'b', 'b', 'b']
