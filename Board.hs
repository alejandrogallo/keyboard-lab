{-# LANGUAGE DeriveGeneric #-}
module Board where

import qualified Keyboard as KB
import GHC.Generics ( Generic )
-- Well a board is simply a keyboard with more addons into it.h,
-- like the Promicro, trrs connectors etc...

data Switch = Alps | Mx | Tec
  deriving Generic

data Board = Board
  { name :: String
  , keyboard :: KB.Keyboard
  , switch :: Switch
  } deriving Generic

