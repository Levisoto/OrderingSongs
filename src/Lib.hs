{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}


module Lib where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as B
import GHC.Generics
import Data.Text

data Song =
  Song { year  :: !Text
         , country   :: !Text
         , region        :: !Text
         , artist :: !Text
         , song :: !Text
           } deriving (Show,Generic)

instance FromJSON Song
instance ToJSON Song

someFunc :: IO ()
someFunc = putStrLn "someFunc"

getJSON :: IO B.ByteString
getJSON = B.readFile "listSongs.json"

decoder :: Either a b -> b
decoder (Left _) = error "Error"
decoder (Right x) = x

ordering :: [Song] -> [Text]
ordering [] = []
ordering (x:xs) = (artist x) : ordering xs
