{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeSynonymInstances #-}
module KeyboardReader where

import Dhall ( FromDhall, input, auto )
import Keyboard ( Key, Keyboard )
import Board ( Board )
import Data.Text (pack)

instance FromDhall Key
instance FromDhall Board

readKeyboard :: String -> IO Keyboard
readKeyboard p = input auto $ pack p

readBoard :: String -> IO Board
readBoard p = input auto $ pack p
