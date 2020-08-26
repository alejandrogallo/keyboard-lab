module Atreus where

import Keyboard


atreus :: Keyboard
atreus = [ Key 0.0 (0.0 * sepY) "כ"
         , Key 0.0 (1.0 * sepY) "Z"
         , Key 0.0 (2.0 * sepY) "A"
         , Key 0.0 (3.0 * sepY) "Q"

         , Key sepX1 (0.0 * sepY + offY1) "א"
         , Key sepX1 (1.0 * sepY + offY1) "X"
         , Key sepX1 (2.0 * sepY + offY1) "S"
         , Key sepX1 (3.0 * sepY + offY1) "W"

         , Key sepX2 (0.0 * sepY + offY2) "ב"
         , Key sepX2 (1.0 * sepY + offY2) "C"
         , Key sepX2 (2.0 * sepY + offY2) "D"
         , Key sepX2 (3.0 * sepY + offY2) "E"

         , Key sepX3 (0.0 * sepY + offY3) "ד"
         , Key sepX3 (1.0 * sepY + offY3) "V"
         , Key sepX3 (2.0 * sepY + offY3) "F"
         , Key sepX3 (3.0 * sepY + offY3) "R"

         , Key sepX4 (0.0 * sepY + offY4) "ל"
         , Key sepX4 (1.0 * sepY + offY4) "B"
         , Key sepX4 (2.0 * sepY + offY4) "G"
         , Key sepX4 (3.0 * sepY + offY4) "T"

         , Key sepX5 (0.0 * sepY + offY5) "ל"
         , Key sepX5 (1.0 * sepY + offY5) "ל"

         ]

    where sepY = 1.95
          sepX1 = 1.9
          sepX2 = 2 * sepX1
          sepX3 = 3 * sepX1
          sepX4 = 4 * sepX1
          sepX5 = 5 * sepX1
          offY1 = 0.4
          offY2 = 2 * offY1
          offY3 = 1 * offY1
          offY4 = 0 * offY1
          offY5 = (-0.8) * offY1
