import           Diagrams.Prelude
import           Diagrams.Backend.SVG.CmdLine

import qualified Args                          as A
import           Alps                           ( alpsFootprint
                                                , tecFootprint
                                                )
import           Mx                             ( mxFootprint )
import qualified Atreus
import qualified Buzurg
import qualified Cutting                       as C
import           Keyboard
import           Promicro

cmToPx = 37.79527559055118

switchFootprint :: A.KeyswitchName -> Footprint
switchFootprint a = case a of
  A.Tec  -> tecFootprint
  A.Alps -> alpsFootprint
  A.Mx   -> mxFootprint

keyboardFromName :: A.KeyboardName -> (Keyboard, Footprint)
keyboardFromName A.Nammu  = (Atreus.atreus, Atreus.squaredCase)
keyboardFromName A.Utu    = (Atreus.orthoAtreus, Atreus.squaredCase)
keyboardFromName A.Buzurg = (Buzurg.keyboard, Atreus.squaredCase)

drawProject :: A.Options -> Diagram B
drawProject o = d # scale cmToPx # op
 where
  (keyboard, plate) = keyboardFromName . A.name $ o
  switch = switchFootprint . A.keyswitch $ o
  kbD = drawKeyboard switch keyboard
  thirdParty = vsep 0.0 [ if A.noPromicro o then mempty else promicro
                        , if A.noTrrs o then mempty else trrs
                        ]
  electronics = kbD # center <> thirdParty # center # translate (5.0 ^& 2.5)
  d = hsep 0.5 [electronics <> plate # lc C.cutting # center, base]
  base = if not $ A.withBase o then mempty else plate # lc C.cutting # center
  op = if A.right o then reflectX else id

main :: IO ()
main = mainWith drawProject
