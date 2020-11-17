import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

import qualified Args as A
import Alps (alpsFootprint, tecFootprint)
import Mx (mxFootprint)
import qualified Atreus
import Keyboard
import Promicro

cmToPx = 37.79527559055118

switchFootprint :: A.KeyswitchName -> Footprint
switchFootprint a =
 case a of
  A.Tec -> tecFootprint
  A.Alps -> alpsFootprint
  A.Mx -> mxFootprint

keyboardFromName :: A.KeyboardName -> (Keyboard, Footprint)
keyboardFromName A.Nammu = (Atreus.atreus, Atreus.squaredCase)
keyboardFromName A.Utu = (Atreus.orthoAtreus, Atreus.squaredCase)

drawProject :: A.Options -> Diagram B
drawProject o = d # scale cmToPx # op
  where
    (kb, kbCase) = keyboardFromName . A.name $ o
    switch = switchFootprint . A.keyswitch $ o
    kbD = drawKeyboard switch kb
    c = kbCase # translate (r2 (-1.5, -1.5))
    thirdParty = (vsep 0.0 [promicro, trrs]) # translate (10.2 ^& 5)
    d = (kbD `atop` c) <> thirdParty
    op = if A.right o then reflectX else id

main :: IO ()
main = mainWith drawProject
