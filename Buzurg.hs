module Buzurg where

import Keyboard

keyboard :: Keyboard
keyboard =
  [ k 2.61 (ς $ -5.44)
  , k 2.76 (ς $ -3.75)
  , k 2.91 (ς $ -2.05)
  --
  , k 0.44 (ς $ -3.19)
  , k 0.88 (ς $ -1.54)
  , k 1.32 (ς 0.10)
  --
  , k 6.75 (ς $ -2.21)
  , k 6.90 (ς $ -3.90)
  , k 7.05 (ς $ -5.60)
  --
  , k 4.82 (ς $ -6.18)
  , k 4.82 (ς $ -4.20)
  , k 4.82 (ς $ -2.20)
  --
  , k 8.52 (ς $ -1.77)
  , k 8.67 (ς $ -3.46)
  , k 8.82 (ς $ -5.16)
  ]
  where
    k x y = Key x y 0 ""
    ς x = - 3 + abs x - 3
    abs a = if a < 0 then (-a) else a
