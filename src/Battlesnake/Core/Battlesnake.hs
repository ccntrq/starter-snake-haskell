{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.Battlesnake where

import Battlesnake.Core.Coordinate (Coordinate)
import Data.Aeson (FromJSON, ToJSON)
import Data.Text
import GHC.Generics

data Battlesnake = Battlesnake
  { id :: Text,
    name :: Text,
    health :: Integer,
    body :: [Coordinate],
    latency :: Text,
    head :: Coordinate,
    length :: Integer,
    shout :: Text,
    squad :: Maybe Text
  }
  deriving (Show, Generic)

instance ToJSON Battlesnake

instance FromJSON Battlesnake
