import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

import Alps
import Atreus
import Keyboard
import Promicro

cmToPx = 37.79527559055118

splitHalf = drawKeyboard alpsFootprint atreus <>  promicro # translate (9.8 ^& 5.6)
bothHalfs = splitHalf ||| strutX 1 ||| splitHalf # reflectX

myMain :: String -> Diagram B
myMain s | s == "both" = bothHalfs # scale cmToPx
         | s == "left" = splitHalf # scale cmToPx
         | otherwise = splitHalf # reflectX # scale cmToPx


main = mainWith myMain
