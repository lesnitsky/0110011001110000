{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Data.StringInstances where

import           Data.List   (List (Cons, Nil))
import           Data.String (IsString (fromString))
import           Prelude     (Char)
import           Prelude     (String)

instance IsString (List Char) where
  fromString :: String -> List Char
  fromString ""      = Nil
  fromString (h : t) = Cons h (fromString t)
