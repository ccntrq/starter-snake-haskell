{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.Game where

import Battlesnake.Core.Ruleset
import Data.Aeson (FromJSON)
import Data.Text
import GHC.Generics

data Game = Game
  { id :: Text,
    ruleset :: Ruleset,
    timeout :: Integer
  }
  deriving (Show, Eq, Generic)

instance FromJSON Game
