{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.Battlesnake where

import Battlesnake.Core.Coordinate (Coordinate)
import Battlesnake.Core.Customizations (Customizations)
import Data.Aeson (FromJSON, ToJSON)
import Data.Text
import GHC.Generics

{-|
  A snake in the game.
  See: https://docs.battlesnake.com/api/objects/battlesnake
-}
data Battlesnake = Battlesnake
  { id :: Text
  -- ^ The ID of the snake.
  , name :: Text
  -- ^ The name of the snake.
  , health :: Integer
  -- ^ Current health of the snake (0-100).
  , body :: [Coordinate]
  -- ^ A list of coordinates representing the snake's body.
  , latency :: Text
  -- ^ The snake's latency.
  , head :: Coordinate
  -- ^ The position of the snakes head
  , length :: Integer
  -- ^ The length of the snake.
  , shout :: Text
  -- ^ The snake's last moves shout.
  , squad :: Maybe Text
  -- ^ The squad the snake is a part of (In squad mode).
  , customizations :: Customizations
  -- ^ The customizations of the snake
  }
  deriving (Show, Generic)

instance ToJSON Battlesnake

instance FromJSON Battlesnake
