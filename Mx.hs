module Mx where

import           Diagrams.Prelude
import           Keyboard                       ( Footprint )
import qualified Cutting                       as C

-- Dimension from:
-- https://cdn.sparkfun.com/datasheets/Components/Switches/MX%20Series.pdf

mxFootprintWidth, mxFootprintHeight, mxWidth, mxHeight :: Double
mxFootprintWidth = inchToCm 0.55
mxFootprintHeight = mxFootprintWidth
mxWidth = 1.56
mxHeight = mxWidth

mxBase :: Footprint
mxBase =
  rect mxFootprintWidth mxFootprintHeight
    <> rect mxWidth mxHeight
    #  lc C.cutting

mxFootprint :: Footprint
mxFootprint = mxBase <> centralHole <> ledHoles <> pcbHoles <> pinHoles
 where
  delta = inchToCm 0.05
  fromRelCoord c = (fst c * delta, snd c * delta)
  h :: Footprint -> [(Double, Double)] -> Footprint
  h p cs = mconcat $ place p . p2 <$> map fromRelCoord cs
  pinHoles = h pinHole [(-3, 2), (2, 4)]
  pcbHoles = h pcbHole [ (i, 0) | i <- [-4, 4] ]
  ledHoles = h ledHole [ (i, -4) | i <- [-3, -1, 1, 3] ]

inchToCm :: Double -> Double
inchToCm = (* 2.54)

centralHole, pcbHole, pinHole, ledHole, centerMarker :: Footprint
centralHole = circle (inchToCm $ 0.157 / 2) # lc blue <> centerMarker
pcbHole = circle (inchToCm $ 0.067 / 2) # lc blue <> centerMarker
pinHole = circle (inchToCm $ 0.059 / 2) # lc blue <> centerMarker
ledHole = circle $ inchToCm $ 0.0039 / 2
centerMarker = circle 0.01 # fc red # lc red
