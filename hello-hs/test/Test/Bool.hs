module Test.Bool where

import Test.Tasty
import Test.Tasty.HUnit

import "hello-hs" Data.Bool (Bool(..), (&&))

boolTests :: TestTree
boolTests = testGroup "Unit tests"
  [ testCase "True && False == False" (True && False @?= False)
  ]
