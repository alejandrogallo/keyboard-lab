module Args where

import           Options.Applicative
import           Diagrams.Backend.CmdLine       ( Parseable
                                                , parser
                                                )

data KeyswitchName = Tec | Alps | Mx
  deriving Read

data KeyboardName = Nammu | Utu | Buzurg
  deriving Read

data Options = Options
  { name      :: KeyboardName
  , keyswitch :: KeyswitchName
  , left      :: Bool
  , right     :: Bool
  , withBase  :: Bool
  }

_keyboard :: Parser KeyboardName
_keyboard = option auto (long "keyboard" <> help "Name of the keyboard")

_keyswitch :: Parser KeyswitchName
_keyswitch = option auto (long "keyswitch" <> help "Name of the keyswitch")

options :: Parser Options
options =
  Options
    <$> _keyboard
    <*> _keyswitch
    <*> switch (long "left" <> help "Export left side")
    <*> switch (long "right" <> help "Export right side")
    <*> switch
          (  long "with-base"
          <> help "Wether or not to export the base for lasercut services"
          )

instance Parseable Options where
  parser = options
