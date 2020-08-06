module Encoding.RLE where

import           Control.Category     ((<<<))
import           Data.List
import           Data.Maybe           (fromMaybe)
import           Data.StringInstances ()
import           Prelude              (Char, Int, undefined)

type RLE = List (Int, Char)

rle :: List Char -> RLE
rle = map (\list -> (length list, fromMaybe '_' (head list))) <<< group

unrle :: RLE -> List Char
unrle = undefined

-- >>> rle "aaaabbccc"
-- [(4,'a'), (2,'b'), (3,'c')]
