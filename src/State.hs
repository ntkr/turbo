module State ( State (..) ) where


-- Each string passed in represents a line of text
data State = State String [String]
