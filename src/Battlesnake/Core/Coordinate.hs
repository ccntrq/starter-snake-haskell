{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.Core.Coordinate where

import Data.Aeson
  ( FromJSON (parseJSON),
    KeyValue ((.=)),
    ToJSON (toEncoding),
    pairs,
    withObject,
    (.:),
  )
import GHC.Generics

-- | Represents a coordinate on the game board.
data Coordinate = Coordinate
  { coordX :: Integer, -- ^ The X coordinate (0 indexed, from left to right)
    coordY :: Integer -- ^ The Y coordinate (0 indexed, from bottom to top)
  }
  deriving (Show, Eq, Generic)

instance ToJSON Coordinate where
  toEncoding (Coordinate x y) = pairs ("x" .= x <> "y" .= y)

instance FromJSON Coordinate where
  parseJSON = withObject "Coordinate" $ \v -> Coordinate <$> v .: "x" <*> v .: "y"
