{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.API.MoveResponse where

import Battlesnake.Core.Direction
import Data.Aeson (ToJSON)
import Data.Text
import GHC.Generics

-- | The response to a move request.
data MoveResponse = MoveResponse
  { move :: Direction, -- ^ The direction for the next move.
    shout :: Maybe Text -- ^ An optional shout to be displayed with the move.
  }
  deriving (Show, Generic)

instance ToJSON MoveResponse
