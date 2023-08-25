module Battlesnake.Server (GameRequestHandler, runBattlesnakeServer) where

import Battlesnake.API.GameRequest
import qualified Battlesnake.API.InfoResponse as Info
import Battlesnake.API.MoveResponse
import Control.Monad.IO.Class (liftIO)
import Data.Functor ((<&>))
import Data.Maybe (fromMaybe)
import System.Environment (lookupEnv)
import System.IO (BufferMode (LineBuffering), hSetBuffering, stdout)
import Text.Read (readMaybe)
import Web.Scotty

-- | A handler for a battlesnake server request.
type GameRequestHandler a = GameRequest -> IO a

{-|
  Run a battlesnake server. Runs the server on the port specified by the environment variable "PORT" or port 3000 if the variable is not set.

  * An IO action that returns a "Battlesnake.API.InfoResponse" which is run on info requests.

  * A 'GameRequestHandler' to be called when the server receives a start request.

  * A 'GameRequestHandler' to be called when the server receives a move request.

  * A 'GameRequestHandler' to be called when the server receives an end request.
-}
runBattlesnakeServer
  :: IO Info.InfoResponse
  -> GameRequestHandler ()
  -> GameRequestHandler MoveResponse
  -> GameRequestHandler ()
  -> IO ()
runBattlesnakeServer info startHandler moveHandler endHandler = do
  hSetBuffering stdout LineBuffering
  envPort <- lookupEnv "PORT" <&> (readMaybe =<<)
  scotty (fromMaybe 3000 envPort) $
    routes
      info
      startHandler
      moveHandler
      endHandler

routes
  :: IO Info.InfoResponse
  -> GameRequestHandler ()
  -> GameRequestHandler MoveResponse
  -> GameRequestHandler ()
  -> ScottyM ()
routes info startHandler moveHandler endHandler = do
  get "/" $ handleInfoRequest info
  post "/start" $ handleStartRequest startHandler
  post "/move" $ handleMoveRequest moveHandler
  post "/end" $ handleEndRequest endHandler

handleInfoRequest :: IO Info.InfoResponse -> ActionM ()
handleInfoRequest info = liftIO info >>= json

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
