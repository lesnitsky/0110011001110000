{-# LANGUAGE LambdaCase #-}

module Data.Bool where

import Prelude (String)

data Bool
  = True
  | False

stringify :: Bool -> String
stringify True = "True"
stringify False = "False"

(&&) :: Bool -> Bool -> Bool
True && True = True
_ && _ = False

and :: Bool -> Bool -> Bool
and = (&&)

(||) :: Bool -> Bool -> Bool
False || False = False
_ || _ = True

not :: Bool -> Bool
not True = False
not False = True

(^) :: Bool -> Bool -> Bool
False ^ False = False
True ^ True = False
_ ^ _ = True

cond :: Bool -> a -> a -> a
cond b x y = case b of
  True -> x
  False -> y
