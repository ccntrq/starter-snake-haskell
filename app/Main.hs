module Main where

import Battlesnake.API.GameRequest
import qualified Battlesnake.API.InfoResponse as Info
import Battlesnake.API.MoveResponse
import Battlesnake.Core.Direction
import Battlesnake.Server

main :: IO ()
main =
  runBattlesnakeServer
    snakeInfo
    startHandler
    moveHandler
    endHandler

snakeInfo :: IO Info.InfoResponse
snakeInfo =
  return
    Info.InfoResponse
      { Info.apiversion = "1"
      , -- Optional Customization:
        Info.author = Nothing -- TODO: Your Battlsnake username here
      , Info.color = Nothing -- TODO: pesonalize
      , Info.head = Nothing -- TODO: pesonalize
      , Info.tail = Nothing -- TODO: pesonalize
      , Info.version = Nothing -- TODO: Version number or tag for your battlesnake
      }

-- TODO:
-- implement start handler if you need to allocate ressources or data at the
-- beginning of a game
startHandler :: GameRequest -> IO ()
startHandler = const $ return ()

-- TODO:
-- implement your game logic here.
moveHandler :: GameRequest -> IO MoveResponse
moveHandler g = do
  print g
  return $ MoveResponse UP (Just "always going up!")

-- TODO:
-- implement end handler if you want to clean up after a game has ended
endHandler :: GameRequest -> IO ()
endHandler = const $ return ()
