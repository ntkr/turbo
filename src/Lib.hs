module Lib
    ( Lib.render
    , getInitialState
    ) where

import UI.NCurses as NC
import State
import System.Directory
import Update


-- draw lines on the screen
render :: [String] -> IO [String]
render lns = do
    ch <- NC.runCurses $ do

        win <- NC.defaultWindow

        NC.updateWindow win NC.clear
        NC.updateWindow win $ iterRender lns 0
        NC.render

        getInput win

    update lns ch

        


-- Recursively iterate over each of the strings
-- in `State` and write each on a new line
iterRender :: [String] -> Integer -> Update ()
iterRender [] ln = return ()
iterRender (str:strs) ln = do
    NC.moveCursor ln 0
    NC.drawString $ stripChars "\"" str
    iterRender strs (ln + 1)


stripChars :: String -> String -> String
stripChars = filter . flip notElem


getInitialState :: IO [String]
getInitialState = do
    
    cwd <- getCurrentDirectory
    dirs <- getDirectoryContents cwd

    let strDirs = map show dirs

    return strDirs

