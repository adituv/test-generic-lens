{-# LANGUAGE DeriveGeneric #-}
module B where

import GHC.Generics

data TypeB = TypeB
  { uniqueFieldB :: Int
  , duplicateField :: String
  , uniqTypeField :: Char
  } deriving (Show, Generic)
