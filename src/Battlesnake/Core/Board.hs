{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.Board where

import Battlesnake.Core.Battlesnake (Battlesnake)
import Battlesnake.Core.Coordinate (Coordinate)
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics

{-|
  The game board.
  See: https://docs.battlesnake.com/api/objects/board
-}
data Board = Board
  { height :: Integer, -- ^ The height of the board
    width :: Integer, -- ^ The width of the board
    food :: [Coordinate], -- ^ A list of coordinates representing food locations
    hazards :: [Coordinate], -- ^ A list of coordinates representing hazard locations
    snakes :: [Battlesnake] -- ^ A list of all snakes on the board
  }
  deriving (Show, Generic)

instance ToJSON Board

instance FromJSON Board
