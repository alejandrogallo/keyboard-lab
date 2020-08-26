module Keyboard where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

import Alps

type Keyboard = [Key]

data Key
 = Key { keyX :: Double
       , keyY :: Double
       , keyLabel :: String
       }

drawKeyboard :: Keyboard -> Diagram B
drawKeyboard kb = mconcat $ map drawKey kb
  where drawKey :: Key -> Diagram B
        drawKey k = place (textFootprint $ keyLabel k) $ p2 (keyX k, keyY k)

textFootprint :: String -> Diagram B
textFootprint s = text s # scale 0.5  <> tecFootprint
