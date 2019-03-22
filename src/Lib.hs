module Lib
    ( renderTurbo
    ) where

import UI.NCurses
import State



renderTurbo :: [String] -> IO ()
renderTurbo state = runCurses $ do

    win <- defaultWindow

    updateWindow win $ do
        iterRender state 0

    render
    waitFor win (\ev -> 
        ev == EventCharacter 'q' || ev == EventCharacter 'Q')



-- Recursively iterate over each of the strings
-- in `State` and write each on a new line
iterRender :: [String] -> Integer -> Update ()
iterRender [] ln = return ()
iterRender (str:strs) ln = do
    moveCursor ln 0
    drawString $ stripChars "\"" str
    iterRender strs (ln + 1)


stripChars :: String -> String -> String
stripChars = filter . flip notElem


waitFor :: Window -> (Event -> Bool) -> Curses ()
waitFor w p = loop where
    loop = do
        ev <- getEvent w Nothing
        case ev of
            Nothing -> loop
            Just ev' -> if p ev' then return () else loop
