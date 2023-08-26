{-# LANGUAGE DeriveGeneric #-}
module Battlesnake.Core.Customizations where

import Data.Aeson (FromJSON, ToJSON)
import Data.Text
import GHC.Generics

{-|
  Battlesnake customizations object
  See: https://docs.battlesnake.com/api/objects/battlesnake
-}
data Customizations = Customizations
  { color :: Text
  -- ^ A hex color code used to display the snake
  , head :: Text
  -- ^ Displayed head of the battlesnake. See
  -- https://docs.battlesnake.com/guides/customizations for available options
  , tail :: Text
  -- ^ Displayed tail of the battlesnake. See
  -- https://docs.battlesnake.com/guides/customizations for available options
  }
  deriving (Show, Generic)

instance ToJSON Customizations

instance FromJSON Customizations
