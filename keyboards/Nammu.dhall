let Types = ../Types.dhall

let k =
      \(x : Double) ->
      \(y : Double) ->
        { keyX = x, keyY = y, keyAngle = 0.0, keyLabel = "" }

in  { name = "Nammu"
    , switch = Types.Switch.Mx
    , keyboard =
      [ k 0.0 0.0
      , k 0.0 1.95
      , k 0.0 3.9
      , k 0.0 5.85
      , k 2.0 0.4
      , k 2.0 2.35
      , k 2.0 4.3
      , k 2.0 6.25
      , k 4.0 0.8
      , k 4.0 2.75
      , k 4.0 4.7
      , k 4.0 6.65
      , k 6.0 0.4
      , k 6.0 2.35
      , k 6.0 4.3
      , k 6.0 6.25
      , k 8.0 0.0
      , k 8.0 1.95
      , k 8.0 3.9
      , k 8.0 5.85
      , k 10.0 -0.32
      , k 10.0 1.63
      ]
    }
