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

data Coordinate = Coordinate
  { coordX :: Integer,
    coordY :: Integer
  }
  deriving (Show, Eq, Generic)

instance ToJSON Coordinate where
  toEncoding (Coordinate x y) = pairs ("x" .= x <> "y" .= y)

instance FromJSON Coordinate where
  parseJSON = withObject "Coordinate" $ \v -> Coordinate <$> v .: "x" <*> v .: "y"
