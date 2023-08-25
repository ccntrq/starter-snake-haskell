module Battlesnake.Core.Direction where

import Data.Aeson (ToJSON, Value (String), toJSON)
import Data.Text

{-|
  The possible directions your snake can move in.
  See: https://docs.battlesnake.com/api/requests/move
-}
data Direction = UP | DOWN | LEFT | RIGHT deriving (Ord, Eq, Show)

instance ToJSON Direction where
  toJSON = String . toLower . pack . show
