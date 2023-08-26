{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.RulesetSettings where

import Data.Aeson (FromJSON)
import GHC.Generics

{-|
  Information about the ruleset settings used in the game.
  See: https://docs.battlesnake.com/api/objects/ruleset-settings
-}
data RulesetSettings = RulesetSettings
  { foodSpawnChance :: Int
  -- ^ The chance of a food spawning on a new round (0-100).
  , minimumFood :: Int
  -- ^ The minimum number of food that must be kept on the board
  , hazardDamagePerTurn :: Int
  -- ^ The amount of damage snakes take each turn they are in contact with a
  -- hazard. This stacks on top of the base damage of 1 that each snake takes
  -- per turn
  , royale :: RoyaleModeSettings
  -- ^ Settings uses in 'royale' mode
  , squad :: SquadModeSettings
  -- ^ Settings used in 'squad' mode
  }
  deriving (Show, Eq, Generic)

instance FromJSON RulesetSettings

-- | Settings used in `royale` mode
newtype RoyaleModeSettings = RoyaleModeSettings
  { shrinkEveryNTurns :: Int
  -- ^ The number of turns between shrinking the safe board area
  }
  deriving (Show, Eq, Generic)

instance FromJSON RoyaleModeSettings

-- | Settings used in 'squad' mode
data SquadModeSettings = SquadModeSettings
  { allowBodyCollisions :: Bool
  -- ^ Whether or not snakes on the same squad can collide with each other
  -- without diyng
  , sharedElimination :: Bool
  -- ^ Whether or not snakes on the same squad  are eliminated together
  , sharedHealth :: Bool
  -- ^ Whether or not snakes on the same squad share health
  , sharedLength :: Bool
  -- ^ Whether or not snakes on the same squad share length
  }
  deriving (Show, Eq, Generic)

instance FromJSON SquadModeSettings