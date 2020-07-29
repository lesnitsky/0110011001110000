{-# LANGUAGE LambdaCase #-}

module Data.Bool where

import           Prelude (Eq, Show)
data Bool
  = True
  | False
  deriving (Show, Eq)

(&&) :: Bool -> Bool -> Bool
True && True = True
_ && _ = False

and :: Bool -> Bool -> Bool
and = (&&)

(||) :: Bool -> Bool -> Bool
False || False = False
_ || _ = True

not :: Bool -> Bool
not True  = False
not False = True

(^) :: Bool -> Bool -> Bool
False ^ False = False
True ^ True = False
_ ^ _ = True

cond :: Bool -> a -> a -> a
cond True a _  = a
cond False _ b = b
