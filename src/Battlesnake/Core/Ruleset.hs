{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.Ruleset where

import Battlesnake.Core.RulesetSettings (RulesetSettings)
import Data.Aeson (FromJSON)
import Data.Text
import GHC.Generics

{-|
  Information about the ruleset used in the game.
  See: https://docs.battlesnake.com/api/objects/ruleset
-}
data Ruleset = Ruleset
  { name :: Text
  -- ^ The name of the ruleset.
  , version :: Text
  -- ^ The version of the ruleset.
  , settings :: RulesetSettings
  }
  deriving (Show, Eq, Generic)

instance FromJSON Ruleset
