{-# LANGUAGE LambdaCase #-}

module Data.Bool where

import Prelude (String)

data Bool
  = True
  | False

-- stringify :: Bool -> String
-- stringify = \case
--   True -> "True"
--   False -> "False"

stringify :: Bool -> String
stringify True = "True"
stringify False = "False"

(&&) :: Bool -> Bool -> Bool
True && True = True
_ && _ = False

-- x && y = case x of
--   True -> case y of
--     True -> True
--     False -> False
--   False -> False

-- stringify (True `and` False)
and :: Bool -> Bool -> Bool
and = (&&)
