module Templates where

import Data.List (intersperse)

type TemplateName = String
newtype Template = Template TemplateName

join :: [FilePath] -> FilePath
join = mconcat . intersperse "/"

templateDirectory :: FilePath
templateDirectory = "templates"

tplPath :: Template -> FilePath
tplPath (Template name) = join [templateDirectory, name]
