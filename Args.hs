module Args where

import Options.Applicative
    ( Parser, auto, help, long, option, switch, str, metavar )
import           Diagrams.Backend.CmdLine       ( Parseable
                                                , parser
                                                )

data KeyswitchName = Tec | Alps | Mx
  deriving Read

data KeyboardName = Nammu | Utu | Buzurg
  deriving Read

data Options = Options
  { left      :: Bool
  , right     :: Bool
  , withBase  :: Bool
  , noPromicro  :: Bool
  , noTrrs  :: Bool
  , dhallFile  :: String
  }

_keyboard :: Parser KeyboardName
_keyboard = option auto (long "keyboard" <> help "Name of the keyboard")

_keyswitch :: Parser KeyswitchName
_keyswitch = option auto (long "keyswitch" <> help "Name of the keyswitch")

_dhallFile :: Parser String
_dhallFile = option str (long "dhall" <> help "Dhall file PATH" <> metavar "dhall_file")

options :: Parser Options
options =
  Options
    <$> switch (long "left" <> help "Export left side")
    <*> switch (long "right" <> help "Export right side")
    <*> switch
          (  long "with-base"
          <> help "Wether or not to export the base for lasercut services"
          )
    <*> switch
          (  long "without-promicro"
          <> help "Export the promicro"
          )
    <*> switch
          (  long "without-trrs"
          <> help "Do not export the trrs connector"
          )
    <*> _dhallFile

instance Parseable Options where
  parser = options
