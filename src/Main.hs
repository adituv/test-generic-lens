{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import A
import B

import Data.Generics.Product
import Lens.Micro

sampleA :: TypeA
sampleA = TypeA 1 "typeA" True

sampleB :: TypeB
sampleB = TypeB 2 "typeB" 'x'

main :: IO ()
main = do
  print $ sampleA ^. field @"uniqueFieldA"
  print $ sampleB ^. field @"duplicateField"
  print $ sampleB ^. field @"uniqTypeField"
