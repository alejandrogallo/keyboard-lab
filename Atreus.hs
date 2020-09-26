module Atreus where

import Keyboard


parametrizedAtreus :: Double -> Keyboard
parametrizedAtreus offY1
  = [ Key 0.0 (0.0 * sepY) ""
    , Key 0.0 (1.0 * sepY) ""
    , Key 0.0 (2.0 * sepY) ""
    , Key 0.0 (3.0 * sepY) ""

    , Key sepX1 (0.0 * sepY + offY1) ""
    , Key sepX1 (1.0 * sepY + offY1) ""
    , Key sepX1 (2.0 * sepY + offY1) ""
    , Key sepX1 (3.0 * sepY + offY1) ""

    , Key sepX2 (0.0 * sepY + offY2) ""
    , Key sepX2 (1.0 * sepY + offY2) ""
    , Key sepX2 (2.0 * sepY + offY2) ""
    , Key sepX2 (3.0 * sepY + offY2) ""

    , Key sepX3 (0.0 * sepY + offY3) ""
    , Key sepX3 (1.0 * sepY + offY3) ""
    , Key sepX3 (2.0 * sepY + offY3) ""
    , Key sepX3 (3.0 * sepY + offY3) ""

    , Key sepX4 (0.0 * sepY + offY4) ""
    , Key sepX4 (1.0 * sepY + offY4) ""
    , Key sepX4 (2.0 * sepY + offY4) ""
    , Key sepX4 (3.0 * sepY + offY4) ""

    , Key sepX5 (0.0 * sepY + offY5) ""
    , Key sepX5 (1.0 * sepY + offY5) ""

    ]

    where sepY = 1.95
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
