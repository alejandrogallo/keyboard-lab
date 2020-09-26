module Keyboard where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

type Footprint = Diagram B
type Keyboard = [Key]

data Key
 = Key { keyX :: Double
       , keyY :: Double
       , keyAngle :: Double
       , keyLabel :: String
       }

drawKeyboard :: Footprint -> Keyboard -> Diagram B
drawKeyboard f kb = mconcat $ drawKey <$> kb
  where
    drawKey :: Key -> Diagram B
    drawKey k = place (rotatedKey f k) $ pos k
    pos :: Key -> P2 Double
    pos k = p2 (keyX k, keyY k)
    rotatedKey :: Footprint -> Key -> Footprint
    rotatedKey f k = (textFootprint f $ keyLabel k ) # rotate (angle k)
    angle :: Key -> Angle Double
    angle k = (keyAngle k) @@ deg

textFootprint :: Footprint -> String -> Diagram B
textFootprint f s = text s # scale 0.5 <> f
