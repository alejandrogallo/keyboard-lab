let Types = ../Types.dhall

let Switch = Types.Switch

let k = \(x : Double) -> \(y : Double) -> Types.Key::{ keyX = x, keyY = y }

let digitus-minimus = [ k 0.44 -2.41, k 0.88 -4.16, k 1.32 -5.9 ]

let digitus-medicus = [ k 2.61 -0.41, k 2.76 -2.10, k 2.91 -3.95 ]

let digitus-medius = [ k 4.82 +0.10, k 4.82 -1.80, k 4.82 -3.8 ]

let digitus-index = [ k 6.75 -3.99, k 6.90 -2.3, k 7.05 -0.6 ]

let digitus-index-2 = [ k 8.82 -0.84, k 8.67 -2.54, k 8.62 -4.23 ]

let digitus-pollex = [ k 6.72 -6.23, k 8.52 -6.53, k 10.30 -7.0 ]

in  { name = "Buzurg"
    , switch = Switch.Mx
    , keyboard =
          digitus-minimus
        # digitus-medicus
        # digitus-medius
        # digitus-index
        # digitus-index-2
        # digitus-pollex
    }
