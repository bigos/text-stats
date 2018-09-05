module Main where

import Debug.Trace
import System.IO
import System.Directory
-- import System.FilePath
import Data.String.Utils
import Control.Monad

putFile p = do
  putStrLn p
  putStrLn "-----------------------"
  ccc <- readFile p
  putStrLn (show ccc)

main :: IO ()
main = do
  putStrLn "\nafter the script in notes.org"
  let path = "/tmp/russy/rus" :: FilePath
  putStrLn path
  dex <- (doesDirectoryExist path)
  putStrLn ( "exists? " ++ (show dex))
  let nd = listDirectory path
  nd >>= (\l->  putStrLn (show l))
  setCurrentDirectory path
  ncd <- getCurrentDirectory
  putStrLn $ "------" ++ ncd
  nd >>= (\fls->
            mapM_ (\f->
                     putFile (ncd ++ "/" ++f))
            fls)
  putStrLn "finished\n"
