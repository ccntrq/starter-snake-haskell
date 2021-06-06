module Battlesnake.Server where

import Battlesnake.API.GameRequest
import qualified Battlesnake.API.InfoResponse as Info
import Battlesnake.API.MoveResponse
import Control.Monad.IO.Class (liftIO)
import Data.Functor ((<&>))
import Data.Maybe (fromMaybe)
import System.Environment (lookupEnv)
import Text.Read (readMaybe)
import Web.Scotty

type GameRequestHandler a = GameRequest -> IO a

runBattlesnakeServer ::
  Info.InfoResponse ->
  GameRequestHandler () ->
  GameRequestHandler MoveResponse ->
  GameRequestHandler () ->
  IO ()
runBattlesnakeServer info startHandler moveHandler endHandler = do
  envPort <- lookupEnv "PORT" <&> (readMaybe =<<)
  scotty (fromMaybe 3000 envPort) $
    routes
      info
      startHandler
      moveHandler
      endHandler

routes ::
  Info.InfoResponse ->
  GameRequestHandler () ->
  GameRequestHandler MoveResponse ->
  GameRequestHandler () ->
  ScottyM ()
routes info startHandler moveHandler endHandler = do
  get "/" $ handleInfoRequest info
  post "/start" $ handleStartRequest startHandler
  post "/move" $ handleMoveRequest moveHandler
  post "/end" $ handleEndRequest endHandler

handleInfoRequest :: Info.InfoResponse -> ActionM ()
handleInfoRequest = json

handleStartRequest :: GameRequestHandler () -> ActionM ()
handleStartRequest handler = do
  gameRequest <- jsonData
  liftIO $ handler gameRequest
  return ()

handleMoveRequest :: GameRequestHandler MoveResponse -> ActionM ()
handleMoveRequest handler = do
  gameRequest <- jsonData
  nextMove <- liftIO $ handler gameRequest
  json nextMove

handleEndRequest :: GameRequestHandler () -> ActionM ()
handleEndRequest handler = do
  gameRequest <- jsonData
  liftIO $ handler gameRequest
  return ()
