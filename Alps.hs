module Alps where

import Diagrams.Prelude
import Keyboard (Footprint)

tecFootprint :: Footprint
tecFootprint = mconcat [ alpsBodyFootprint
                       , place leg $ p2 (holeX, holeY)
                       , place leg $ p2 (holeX - sepHole, holeY)
                       , place leg $ p2 (holeX - 2*sepHole, holeY)
                       ]
  where sepHole = (alpsX - xSep * 2) / 2.0
        xSep = 0.3
        ySep = 0.25
        holeY = alpsY/2 - ySep
        holeX = alpsX/2 - xSep

alpsBodyFootprint :: Footprint
alpsBodyFootprint = rect alpsX alpsY

leg :: Footprint
leg = circle 0.08 # fc red # lc red

alpsFootprint :: Footprint
alpsFootprint =
  mconcat [ alpsBodyFootprint
          , place leg $ p2 (holeX                , holeY)
          , place leg $ p2 (holeX - pinSeparation, holeY)
          ]
  where pinSeparation = 0.5
        xSep = (alpsX - pinSeparation) / 2
        ySep = 0.25
        holeY = alpsY/2 - ySep
        holeX = alpsX/2 - xSep

alpsX :: Double
alpsX = 1.5945
alpsY :: Double
alpsY = 1.3
