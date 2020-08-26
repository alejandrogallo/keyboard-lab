import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

import Alps
import Promicro
import Atreus
import Keyboard

cmToPx = 37.79527559055118

splitHalf = drawKeyboard atreus <>  promicro # translate (9.8 ^& 5.6)
bothHalfs = splitHalf ||| strutX 1 ||| splitHalf # reflectX

myMain :: String -> Diagram B
myMain s | s == "both" = bothHalfs # scale cmToPx
         | otherwise = splitHalf # scale cmToPx


main = mainWith myMain
