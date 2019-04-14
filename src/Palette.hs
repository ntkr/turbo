module Palette
    ( Palette (..)
    ) where

import UI.NCurses as NC

-- Red, Blue
data Palette = Palette NC.ColorID NC.ColorID
