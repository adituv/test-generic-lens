{-# LANGUAGE DeriveGeneric #-}
module A where

import GHC.Generics

data TypeA = TypeA
  { uniqueFieldA :: Int
  , duplicateField :: String
  , uniqTypeField :: Bool
  } deriving (Show, Generic)
