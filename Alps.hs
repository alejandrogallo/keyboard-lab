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
        sepHole = (alpsX - xSep * 2) / 2.0
        xSep = 0.3
        ySep = 0.25
        holeY = alpsY/2 - ySep
        holeX = alpsX/2 - xSep

alpsFootprint :: Diagram B
alpsFootprint = rect alpsX alpsY

alpsX :: Double
alpsX = 1.5945
alpsY :: Double
alpsY = 1.3
