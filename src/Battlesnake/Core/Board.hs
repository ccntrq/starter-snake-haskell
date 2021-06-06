{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.Board where

import Battlesnake.Core.Battlesnake (Battlesnake)
import Battlesnake.Core.Coordinate (Coordinate)
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics

data Board = Board
  { height :: Integer,
    width :: Integer,
    food :: [Coordinate],
    hazards :: [Coordinate],
    snakes :: [Battlesnake]
  }
  deriving (Show, Generic)

instance ToJSON Board

instance FromJSON Board
