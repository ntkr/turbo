module Update where

import UI.NCurses as NC


getInput :: Window -> Curses Char
getInput window = loop where
    loop = do
        ev <- getEvent window Nothing
        case ev of
            Just (EventCharacter e) -> return e
            _ -> loop


update :: [String] -> Char -> [String]
update lns char =

    case char of
        -- trim
        't' -> tail lns
