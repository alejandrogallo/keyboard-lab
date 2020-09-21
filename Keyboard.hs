module Keyboard where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

type Footprint = Diagram B
type Keyboard = [Key]

data Key
 = Key { keyX :: Double
       , keyY :: Double
       , keyLabel :: String
       }

drawKeyboard :: Footprint -> Keyboard -> Diagram B
drawKeyboard f kb = mconcat $ map drawKey kb
  where drawKey :: Key -> Diagram B
        drawKey k = place (textFootprint f $ keyLabel k) $ p2 (keyX k, keyY k)

textFootprint :: Footprint -> String -> Diagram B
textFootprint f s = text s # scale 0.5 <> f
