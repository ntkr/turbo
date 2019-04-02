module View 
    ( View (..)
    , generateView
    , plotView
    ) where

import State


data View = View 
    [String] -- lines of text
    Pad
    deriving (Show)

data Pad = Pad 
    Integer -- pad left
    Integer -- pad top
    deriving (Show)


generateView :: State -> View
generateView (State cwd dirs)  = View dirs (Pad 0 0)


-- Convert the view into a 2d charmap
plotView :: View -> [String]
plotView (View lns pad) = lns
