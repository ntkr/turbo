module Main where

import Control.Monad
import Lib
import State
import View
import Palette 
import Debug.Trace
import UI.NCurses as NC
import Update
import Control.Monad.IO.Class


main :: IO ()
main = do


    -- get current state
    state <- getInitialState

    -- main loop
    NC.runCurses $ run state



run :: State -> Curses ()
run state = do


    -- make some colors
    cidRed <- NC.newColorID NC.ColorRed NC.ColorBlack 1
    cidBlue <- NC.newColorID NC.ColorBlue NC.ColorBlack 2

    let palette = Palette cidRed cidBlue


    -- main window
    mainWin <- NC.defaultWindow
    dirsWin <- NC.newWindow 0 0 1 0
    pathWin <- NC.newWindow 1 0 0 0

    -- TODO wrap all these NC.updateWindow calls up...
    (h, w) <- NC.updateWindow mainWin $ NC.windowSize
    NC.updateWindow mainWin $ resizeWindow 100 100

    Lib.render pathWin dirsWin palette state


    -- await input
    ch <- getInput dirsWin

    nextState <- liftIO $ update state ch

    run nextState

