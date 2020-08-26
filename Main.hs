import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

myCircle :: Diagram B
myCircle = circle 1

splitHalf = drawKeyboard atreus <>  promicro # translate ((9.8) ^& 5.6)
bothHalfs = splitHalf ||| strutX 1 ||| splitHalf # reflectX

cmToPx = 37.79527559055118

main = do
  mainWith $ splitHalf # scale cmToPx

data Key
 = Key { keyX :: Double
       , keyY :: Double
       , keyLabel :: String
       }

alpsFootprint :: Diagram B
alpsFootprint = rect alpsX alpsY

alpsX = 1.645
alpsY = 1.33

tecFootprint :: Diagram B
tecFootprint = mconcat $ [ rect alpsX alpsY
                         , place pt $ p2 (holeX, holeY)
                         , place pt $ p2 (holeX - sepHole, holeY)
                         , place pt $ p2 (holeX - 2*sepHole, holeY)
                         ]
  where pt = circle 0.08 # fc red # lc red
        sepHole = (alpsX - 0.4) / 2.0
        holeY = alpsY/2 - 0.2
        holeX = alpsX/2 - 0.2

promicro = mconcat $ [ rect w h ] ++ pinsL ++ pinsR ++ [label]
  where r = 0.1
        pt = circle (r/2) # lc green
        w = 1.8
        h = 3.3
        label = text "pro micro" # (rotate $ 90 @@ deg) # scale 0.5
        pinsR = [ place pt $ p2 (w/2 - r, y * 0.25 - h / 2 + r) | y <- [0..11]]
        pinsL = [ place pt $ p2 (r - w/2, y * 0.25 - h / 2 + r) | y <- [0..11]]


textFootprint :: String -> Diagram B
textFootprint s = text s # scale 0.5  <> tecFootprint


drawKeyboard :: [Key] -> Diagram B
drawKeyboard kb = mconcat $ map drawKey kb
  where drawKey :: Key -> Diagram B
        drawKey k = place (textFootprint $ keyLabel k) $ p2 (keyX k, keyY k)


atreus :: [Key]
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
