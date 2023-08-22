{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.API.GameRequest where

import Battlesnake.Core.Battlesnake (Battlesnake)
import Battlesnake.Core.Board (Board)
import Battlesnake.Core.Game (Game)
import Data.Aeson (FromJSON)
import GHC.Generics

{-|
  The request sent to your battlesnake server on each turn.
  This contains all the information you need to determine your snakes next move.}
-}
data GameRequest = GameRequest
  { game :: Game, -- ^ Information about the current game. (See "Battlesnake.Core.Game")
    turn :: Integer, -- ^ The turn beeing played.
    board :: Board, -- ^ The game board. (See "Battlesnake.Core.Board")
    you :: Battlesnake -- ^ Your snake. (See "Battlesnake.Core.Battlesnake"")
  }
  deriving (Show, Generic)

instance FromJSON GameRequest
