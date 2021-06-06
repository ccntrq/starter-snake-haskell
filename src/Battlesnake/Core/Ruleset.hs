{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.Ruleset where

import Data.Aeson (FromJSON)
import Data.Text
import GHC.Generics

data Ruleset = Ruleset
  { name :: Text,
    version :: Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON Ruleset
