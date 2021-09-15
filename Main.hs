import           Diagrams.Prelude
import           Diagrams.Backend.SVG.CmdLine
import           Diagrams.Backend.CmdLine (mainArgs, mainRender)

import qualified Args                          as A
import           Alps                           ( alpsFootprint
                                                , tecFootprint
                                                )
import           Mx                             ( mxFootprint )
import qualified Atreus
import qualified Buzurg
import qualified Cutting                       as C
import           qualified Keyboard as KB
import           qualified Board as BO
import           KeyboardReader
import           Promicro
import Options.Applicative (execParser)

cmToPx = 37.79527559055118

switchFootprint :: A.KeyswitchName -> KB.Footprint
switchFootprint a = case a of
  A.Tec  -> tecFootprint
  A.Alps -> alpsFootprint
  A.Mx   -> mxFootprint

switchBoardFootprint :: BO.Switch -> KB.Footprint
switchBoardFootprint a = case a of
  BO.Tec  -> tecFootprint
  BO.Alps -> alpsFootprint
  BO.Mx   -> mxFootprint

keyboardFromName :: A.KeyboardName -> (KB.Keyboard, KB.Footprint)
keyboardFromName A.Nammu  = (Atreus.atreus, Atreus.squaredCase)
keyboardFromName A.Utu    = (Atreus.orthoAtreus, Atreus.squaredCase)
keyboardFromName A.Buzurg = (Buzurg.keyboard, Atreus.squaredCase)

{-
drawProject :: A.Options -> Diagram B
drawProject o = d # scale cmToPx # op
 where
  (keyboard, plate) = keyboardFromName . A.name $ o
  switch = switchFootprint . A.keyswitch $ o
  kbD = KB.drawKeyboard switch keyboard
  thirdParty = vsep -1.0 [ if A.noPromicro o then mempty else promicro
                        , if A.noTrrs o then mempty else trrs
                        ]
  electronics = kbD # center <> thirdParty # center # translate (4.0 ^& 2.5)
  d = hsep -1.5 [electronics <> plate # lc C.cutting # center, base]
  base = if not $ A.withBase o then mempty else plate # lc C.cutting # center
  op = if A.right o then reflectX else id
-}

drawBoard :: BO.Board -> A.Options -> Diagram B
drawBoard board os = kbD # scale cmToPx
  where
    kbD = KB.drawKeyboard _switchFootprint keyboard
    _switchFootprint = switchBoardFootprint $ BO.switch board
    keyboard = BO.keyboard board
    switch = A.Mx

main :: IO ()
main = do
  opts <- mainArgs (Identity (const mempty :: A.Options -> Diagram B))
  let dhallFile = A.dhallFile . fst . snd $ opts
  putStrLn dhallFile
  board <- readBoard dhallFile
  putStrLn $ BO.name board
  mainRender opts $ drawBoard board
  return ()
