module Update where

import UI.NCurses as NC
import System.Directory 
import System.FilePath
import State


getInput :: Window -> Curses Char
getInput window = loop where
    loop = do
        ev <- getEvent window Nothing
        case ev of
            Just (EventCharacter e) -> return e
            _ -> loop


update :: State -> Char -> IO State
update (State cwd dirs) char =

    case char of
        -- trim
        't' -> return (State cwd (tail dirs))
        'u' -> upDir (State cwd dirs)
    


upDir :: State -> IO State
upDir (State cwd dirs) = do 
    let newCwd = takeDirectory cwd
    newDirs <- getDirectoryContents newCwd

    let newStrDirs = map show newDirs
    
    return (State newCwd newStrDirs)
    
    
    
