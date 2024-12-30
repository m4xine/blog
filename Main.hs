module Main where

import Hakyll

import Data.Default

config :: Configuration 
config = def 
  { storeDirectory = ".store"
  , destinationDirectory = ".output"
  }

postContext :: Context String
postContext = mconcat
  [ dateField "date" "%m-%d-%Y"
  , defaultContext
  ]

main :: IO ()
main = hakyllWith config do
  match "static/*" do 
    route idRoute
    compile copyFileCompiler

  match "pages/posts/*.md" do
    route $ setExtension "html"
    compile do 
      pandocCompiler
        >>= loadAndApplyTemplate "templates/post.html" postContext
        >>= loadAndApplyTemplate "templates/default.html" postContext

  match "templates/*" do
    compile templateBodyCompiler