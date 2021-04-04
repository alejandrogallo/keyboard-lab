module Sexpr where

import Data.List (intersperse)

data Sexpr
  = Atom String
  | Symbol String
  | List [Sexpr]

instance Show Sexpr where
  show s = case s of
    Atom s -> show s
    Symbol s -> s
    List xs ->
      mconcat $
        ["("] ++ intersperse " " (show <$> xs) ++ [")"]

class Sexpressable a where
  sexpr :: a -> Sexpr
