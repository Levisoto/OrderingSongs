{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
module Main where
import Data.Aeson
import Control.Applicative
import Control.Monad
import qualified Data.ByteString.Lazy as B
import Data.List

import Lib


main :: IO ()
main = do
 -- Get JSON data and decode ist
 a <- getJSON
 let b = B.drop 3 a
 let d = (eitherDecode b) :: Either String [Song]
 -- If d is Left, the JSON was malformed.
 -- In that case, we report the error.
 -- Otherwise, we perform the operation of
 -- our choice. In this case, just print it.
 case d of
  Left err -> putStrLn err
  Right ps -> print $ sortBy compare $ ordering ps
