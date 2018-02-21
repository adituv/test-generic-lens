{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE PackageImports #-}
module Main where

import A
import B

#if MIN_VERSION_generic_lens(0,5,2)
import "generic-lens" Data.Generics.Labels
#else
import Data.Generics.Labels
#endif

import Data.Generics.Product
import Lens.Micro

sampleA :: TypeA
sampleA = TypeA 1 "typeA" True

sampleB :: TypeB
sampleB = TypeB 2 "typeB" 'x'

main :: IO ()
main = do
  print $ sampleA ^. #uniqueFieldA
  print $ sampleB ^. #duplicateField
  print $ sampleB ^. #uniqTypeField
