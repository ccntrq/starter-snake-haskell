{-# LANGUAGE DeriveGeneric #-}

module Battlesnake.API.InfoResponse where

import Data.Aeson (ToJSON)
import Data.Text
import GHC.Generics

data InfoResponse = InfoResponse
  { apiversion :: Text,
    author :: Maybe Text,
    color :: Maybe Text,
    head :: Maybe Text,
    tail :: Maybe Text,
    version :: Maybe Text
  }
  deriving (Show, Generic)

instance ToJSON InfoResponse
