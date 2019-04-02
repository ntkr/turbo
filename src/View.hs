module View 
    ( View (..)
    , generateView
    , plotView
    ) where

import State
import UI.NCurses as NC


data View = View 
    [Text] -- lines of text
    View.Pad
    deriving (Show)


data Text = Text NC.Color [String]
    deriving (Show)


data Pad = Pad 
    Integer -- pad left
    Integer -- pad top
    deriving (Show)


generateView :: State -> View
generateView (State cwd dirs) = 

    let 
        lns = map (\x -> Text (NC.Color 50) x) dirs
    
    in
        View lns (Pad 0 0)


-- Convert the view into a 2d charmap
plotView :: View -> [String]
plotView (View lns pad) = lns
