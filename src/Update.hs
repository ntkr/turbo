module Update where

import UI.NCurses as NC
import System.Directory 
import System.FilePath


getInput :: Window -> Curses Char
getInput window = loop where
    loop = do
        ev <- getEvent window Nothing
        case ev of
            Just (EventCharacter e) -> return e
            _ -> loop


update :: [String] -> Char -> IO [String]
update lns char =

    case char of
        -- trim
        't' -> return $ tail lns


upDir :: [String] -> IO [String]
upDir state = return state
    
