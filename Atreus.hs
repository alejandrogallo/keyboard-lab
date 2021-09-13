module Atreus where

import Diagrams.Prelude
    ( place, fromOffsets, Diagram, Coordinates((^&)) )
import Diagrams.Backend.SVG.CmdLine ( B )

import Keyboard ( Key(Key), Keyboard )
import Screws ( m3 )


squaredCase :: Diagram B
squaredCase = d
 where
  sw     = 1.5
  width  = 1.5 * 8.5
  height = 1.5 * 6.2
  δ      = 0.4
  c      = fromOffsets [0 ^& height, width ^& 0, 0 ^& (-height), (-width) ^& 0]
  screws =
    mconcat
      $   place m3
      <$> [ δ ^& δ
          , (width - δ) ^& δ
          , δ ^& (-δ + height)
          , width / 2 ^& δ
          , width / 1.5 ^& (-δ + height)
          ]
  d = c <> screws


parametrizedAtreus :: Double -> Keyboard
parametrizedAtreus offY1 =
  [ Key 0     (0 * sepY)         0 ""
  , Key 0     (1 * sepY)         0 ""
  , Key 0     (2 * sepY)         0 ""
  , Key 0     (3 * sepY)         0 ""

    -- second column
  , Key sepX1 (0 * sepY + offY1) 0 ""
  , Key sepX1 (1 * sepY + offY1) 0 ""
  , Key sepX1 (2 * sepY + offY1) 0 ""
  , Key sepX1 (3 * sepY + offY1) 0 ""

    -- third column
  , Key sepX2 (0 * sepY + offY2) 0 ""
  , Key sepX2 (1 * sepY + offY2) 0 ""
  , Key sepX2 (2 * sepY + offY2) 0 ""
  , Key sepX2 (3 * sepY + offY2) 0 ""

    -- fourth column
  , Key sepX3 (0 * sepY + offY3) 0 ""
  , Key sepX3 (1 * sepY + offY3) 0 ""
  , Key sepX3 (2 * sepY + offY3) 0 ""
  , Key sepX3 (3 * sepY + offY3) 0 ""

    -- fifth column
  , Key sepX4 (0 * sepY + offY4) 0 ""
  , Key sepX4 (1 * sepY + offY4) 0 ""
  , Key sepX4 (2 * sepY + offY4) 0 ""
  , Key sepX4 (3 * sepY + offY4) 0 ""

    -- sixth column
  , Key sepX5 (0 * sepY + offY5) 0 ""
  , Key sepX5 (1 * sepY + offY5) 0 ""
  ]

 where
  sepY  = 1.95
  sepX1 = 2
  sepX2 = 2 * sepX1
  sepX3 = 3 * sepX1
  sepX4 = 4 * sepX1
  sepX5 = 5 * sepX1
  offY2 = 2 * offY1
  offY3 = 1 * offY1
  offY4 = 0 * offY1
  offY5 = (-0.8) * offY1

atreus :: Keyboard
atreus = parametrizedAtreus 0.4

orthoAtreus :: Keyboard
orthoAtreus = parametrizedAtreus 0.0
