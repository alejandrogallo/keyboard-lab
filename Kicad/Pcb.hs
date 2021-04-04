{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}
module Kicad.Pcb where

import Data.List (intersperse)

import qualified Templates as TPL
import qualified Sexpr as S
import qualified Kicad.Module as KM

type Header = (Int, String)

data General = General
  { thickness :: Double
  , drawings :: Int
  , tracks :: Int
  , zones :: Int
  , nModules :: Int
  , nNets :: Int
  }


data TemplateComponent = TemplateComponent String
data Page = A4 | A3 deriving Show

getTemplateComponentPath :: TemplateComponent -> FilePath
getTemplateComponentPath (TemplateComponent n)
  = TPL.tplPath $ TPL.Template n

data Pcb = Pbc
  { header :: Header
  , general :: General
  , layers :: TemplateComponent
  , setup :: TemplateComponent
  , page :: Page
  , modules :: [KM.Module]
  }


renderPcb :: Pcb -> IO String
renderPcb pcb = do
  layers' <- readFile layersPath
  setup' <- readFile setupPath
  return . mconcat $ intersperse "\n" [ sexpr' header
                                      , sexpr' general
                                      , layers'
                                      , setup'
                                      , sexpr' page
                                      ]
  where
    sexpr' f = show . S.sexpr . f $ pcb
    layersPath = getTemplateComponentPath . layers $ pcb
    setupPath = getTemplateComponentPath . setup $ pcb


instance S.Sexpressable Page where
  sexpr p = S.List [S.Symbol "page", S.Symbol $ show p]

instance S.Sexpressable Header where
  sexpr (version, stamp) = S.List
    [ S.Symbol "kicad_pcb"
    , S.List [S.Symbol "version", S.Symbol $ show version]
    , S.List [S.Symbol "host", S.Symbol "pcbnew", S.Atom stamp]
    ]

instance S.Sexpressable General where
  sexpr g@(General {}) =
    S.List
      [ S.Symbol "general"
      , S.List [S.Symbol "thickness", S.Symbol . show . thickness $ g]
      , S.List [S.Symbol "drawings", S.Symbol . show . drawings $ g]
      , S.List [S.Symbol "tracks", S.Symbol . show . tracks $ g]
      , S.List [S.Symbol "zones", S.Symbol . show . zones $ g]
      , S.List [S.Symbol "modules", S.Symbol . show . nModules $ g]
      , S.List [S.Symbol "nets", S.Symbol . show . nNets $ g]
      ]

  -- sexpr PageA4 = S.List [S.Symbol "page", S.Symbol "A4"]
