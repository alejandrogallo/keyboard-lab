let Types = ../Types.dhall

let Switch = Types.Switch

let k = \(x : Double) -> \(y : Double) -> Types.Key::{ keyX = x, keyY = y }

in  { name = "Buzurg"
    , switch = Switch.Alps
    , keyboard =
      [ k 0.44 -2.71
      , k 0.88 -4.46
      , k 1.32 -6.2
      , k 2.61 -0.56
      , k 2.76 -2.25
      , k 2.91 -3.95
      , k 4.82 +0.18
      , k 4.82 -1.80
      , k 4.82 -3.8
      , k 6.75 -3.79
      , k 6.90 -2.1
      , k 7.05 -0.4
      , k 8.52 -4.23
      , k 8.67 -2.54
      , k 8.82 -0.84
      , k 6.52 -6.23
      , k 8.32 -6.53
      , k 10.0 -7.5
      ]
    }
