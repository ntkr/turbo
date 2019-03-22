module Main where

import System.Directory
import UI.NCurses
import Control.Monad
import Lib


main :: IO ()
main = do

    cwd <- getCurrentDirectory
    dirs <- getDirectoryContents cwd
    
    renderTurbo $ map show dirs


