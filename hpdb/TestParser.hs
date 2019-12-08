{-# LANGUAGE OverloadedStrings, FlexibleContexts, NoMonomorphismRestriction #-}
module Main(main) where

import Control.Concurrent(getNumCapabilities)
import Data.Time(diffUTCTime, getCurrentTime)
import System.Process
import Control.Exception(throw)
import System.Environment(getProgName, getArgs)
import System.Exit(exitWith, exitSuccess, ExitCode(ExitSuccess), ExitCode(..))
import System.Directory(doesFileExist)
import qualified Bio.PDB as PDB(parse, numAtoms)
import Data.Iterable
import Control.Monad(unless)

cmd cmdLine = do exitCode <- system cmdLine
                 unless (exitCode == ExitSuccess) $ throw exitCode

-- Gazal changed this file on Mar 26, 2019
--gzPath=inputPath ++ ".gz"


timeIt io = do
  cpus <- getNumCapabilities
  --putStrLn $ "Running with " ++ show cpus ++ " threads."
  t1 <- getCurrentTime
  r <- io
  t2 <- getCurrentTime
  print $ t2 `diffUTCTime` t1
  return r

main = do
  timeIt $ do
    [inputPath] <- getArgs	
    Just structure <- PDB.parse inputPath
    print $ PDB.numAtoms structure
    print "*" 
