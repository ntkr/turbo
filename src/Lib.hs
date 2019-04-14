module Lib
    ( Lib.render
    , getInitialState
    ) where

import UI.NCurses as NC
import State
import View
import Palette
import System.Directory
import Update


render :: NC.Window -> NC.Window -> Palette -> State -> Curses ()
render pathWin dirsWin palette (State cwd dirs) = do
    renderPath pathWin palette cwd
    renderDirs dirsWin palette dirs
    NC.render


renderPath :: NC.Window -> Palette -> String -> Curses ()
renderPath win (Palette red blue) path = NC.updateWindow win $ do
    NC.setColor red
    NC.drawString path


renderDirs :: NC.Window -> Palette -> [String] -> Curses ()
renderDirs win (Palette red blue) dirs = NC.updateWindow win $ do
    NC.setColor blue
    iterRenderDirs dirs 0

-- Recursively iterate over each of the strings
-- in `State` and write each on a new line
iterRenderDirs :: [String] -> Integer -> Update ()
iterRenderDirs [] ln = return ()
iterRenderDirs (str:strs) ln = do
    NC.moveCursor ln 0
    NC.drawString $ stripChars "\"" str
    iterRenderDirs strs (ln + 1)


stripChars :: String -> String -> String
stripChars = filter . flip notElem


getInitialState :: IO State
getInitialState = do
    
    cwd <- getCurrentDirectory
    dirs <- getDirectoryContents cwd

    let strDirs = map show dirs

    return (State cwd strDirs)

