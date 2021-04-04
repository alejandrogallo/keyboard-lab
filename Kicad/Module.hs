module Kicad.Module where

import qualified Templates as TPL
import qualified Sexpr as S

type Position = (Double, Double)

-- (fp_line (start -3.81 0) (end -3.302 0) (layer F.SilkS) (width 0.2032))
data FpLine = FpLine
  { start :: Position
  , end :: Position
  , lineLayer :: String
  , width :: Double
  }

-- (fp_text reference R1 (at 0 0.127) (layer F.SilkS) hide
--       (effects (font (size 1.397 1.27) (thickness 0.2032))))
data FpText = FpText
  { reference :: String
  , textAt :: Position
  , textLayer :: String
  }

data Module = Module
  { name :: String
  , at :: Position
  , moduleLayer :: String
  , descr :: String
  , tags :: String
  , text :: [FpText]
  , lines :: [FpLine]
  }
