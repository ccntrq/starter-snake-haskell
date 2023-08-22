{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.API.InfoResponse where

import Data.Aeson (ToJSON)
import Data.Text
import GHC.Generics

{-|
  The response to an info request.
  This can be used to modify the appearance of your snake on the game board.
-}
data InfoResponse = InfoResponse
  { apiversion :: Text, -- ^ The API version supported by the battlesnake server (currently 1).
    author :: Maybe Text, -- ^ The username of the author of the snake.
    color :: Maybe Text, -- ^ A color code used to set the color of the snake.
    head :: Maybe Text, -- ^ A custom head to use for the snake. (See https://play.battlesnake.com/customizations for options.)
    tail :: Maybe Text, -- ^ A custom tail to use for the snake. (See https://play.battlesnake.com/customizations for options.)
    version :: Maybe Text -- ^ The version of the snake.
  }
  deriving (Show, Generic)

instance ToJSON InfoResponse
