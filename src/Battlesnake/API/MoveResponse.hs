{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.API.MoveResponse where

import Battlesnake.Core.Direction
import Data.Aeson (ToJSON)
import Data.Text
import GHC.Generics

data MoveResponse = MoveResponse
  { move :: Direction,
    shout :: Maybe Text
  }
  deriving (Show, Generic)

instance ToJSON MoveResponse
