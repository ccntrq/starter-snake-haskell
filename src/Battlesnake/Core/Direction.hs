module Battlesnake.Core.Direction where

import Data.Aeson (ToJSON, Value (String), toJSON)
import Data.Text

data Direction = UP | DOWN | LEFT | RIGHT deriving (Ord, Eq, Show)

instance ToJSON Direction where
  toJSON = String . toLower . pack . show
