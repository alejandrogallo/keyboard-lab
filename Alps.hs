module Alps where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

tecFootprint :: Diagram B
tecFootprint = mconcat [ rect alpsX alpsY
                       , place pt $ p2 (holeX, holeY)
                       , place pt $ p2 (holeX - sepHole, holeY)
                       , place pt $ p2 (holeX - 2*sepHole, holeY)
                       ]
  where pt = circle 0.08 # fc red # lc red
        sepHole = (alpsX - 0.4) / 2.0
        holeY = alpsY/2 - 0.2
        holeX = alpsX/2 - 0.2

alpsFootprint :: Diagram B
alpsFootprint = rect alpsX alpsY

-- alpsX = 1.645
alpsX = 1.5945
-- alpsY = 1.33
alpsY = 1.396
