module Promicro where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

promicro :: Diagram B
promicro = rect w h <> pinsL <> pinsR <> label
  where
    r = 0.1
    pt = circle (r/2) # lc green
    w = 1.8
    h = 3.3
    label = text "promicro" # rotate (90 @@ deg) # scale 0.5
    pinsR = drawPoints [(w/2 - r, y * 0.25 - h / 2 + r) | y <- [0..11]]
    pinsL = drawPoints [(r - w/2, y * 0.25 - h / 2 + r) | y <- [0..11]]
    drawPoints ps = mconcat $ place pt . p2 <$> ps

trrs :: Diagram B
trrs = rect 1.8 0.6 <> text "trrs" # scale 0.5
