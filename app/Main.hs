module Main where

import Control.Monad
import Lib
import State
import View
import Debug.Trace
import UI.NCurses as NC
import Update
import Control.Monad.IO.Class



main :: IO ()
main = do

    -- get current state
    state <- getInitialState

    NC.runCurses $ run state



run :: State -> Curses ()
run state = do

    -- generate view from state
    let view = generateView state

    -- plot view into charmap
    let charmap = plotView view
    
    -- render onto screen
    win <- NC.defaultWindow
    NC.updateWindow win NC.clear
    NC.updateWindow win $ Lib.render charmap
    NC.render

    -- await input
    ch <- getInput win

    nextState <- liftIO $ update state ch

    run nextState

