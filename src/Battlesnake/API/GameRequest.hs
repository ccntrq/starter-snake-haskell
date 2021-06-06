{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.API.GameRequest where

import Battlesnake.Core.Battlesnake (Battlesnake)
import Battlesnake.Core.Board (Board)
import Battlesnake.Core.Game (Game)
import Data.Aeson (FromJSON)
import GHC.Generics

data GameRequest = GameRequest
  { game :: Game,
    turn :: Integer,
    board :: Board,
    you :: Battlesnake
  }
  deriving (Show, Generic)

instance FromJSON GameRequest
