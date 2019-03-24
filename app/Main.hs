module Main where

import Control.Monad
import Lib
import State
import View
import Debug.Trace


main :: IO ()
main = do

    -- get current state
    state <- getInitialState

    run state



run :: [String] -> IO ()
run state = do
    -- generate view from state
    let view = generateView state

    -- plot view into charmap
    let charmap = plotView view

    -- render charmap
    nextState <- render charmap

    run nextState

