let Types = ../Types.dhall

let k =
      \(x : Double) ->
      \(y : Double) ->
        { keyX = x, keyY = y, keyAngle = 0.0, keyLabel = "" }

in  { name = "Utu"
    , switch = Types.Switch.Mx
    , keyboard =
      [ k 0.0 0.0
      , k 0.0 1.95
      , k 0.0 3.9
      , k 0.0 5.85
      , k 2.0 0.0
      , k 2.0 1.95
      , k 2.0 3.9
      , k 2.0 5.85
      , k 4.0 0.0
      , k 4.0 1.95
      , k 4.0 3.9
      , k 4.0 5.85
      , k 6.0 0.0
      , k 6.0 1.95
      , k 6.0 3.9
      , k 6.0 5.85
      , k 8.0 0.0
      , k 8.0 1.95
      , k 8.0 3.9
      , k 8.0 5.85
      , k 10.0 0.0
      , k 10.0 1.95
      ]
    }
