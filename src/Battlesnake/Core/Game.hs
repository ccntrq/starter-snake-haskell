{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.Game where

import Battlesnake.Core.Ruleset
import Data.Aeson (FromJSON)
import Data.Text
import GHC.Generics

{-|
  Information about the current game configuration.
  See: https://docs.battlesnake.com/api/objects/game
-}
data Game = Game
  { id :: Text, -- ^ The ID of the game.
    ruleset :: Ruleset, -- ^ The ruleset used in the game.
    timeout :: Integer -- ^ The maximum time in milliseconds the server will wait for a response from your server.
  }
  deriving (Show, Eq, Generic)

instance FromJSON Game
