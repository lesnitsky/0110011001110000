module Base.Sugar where

($) :: (a -> b) -> a -> b
($) f x = f x
