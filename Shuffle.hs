module Shuffle
(
  shuffle, 
) where 

{- Just the shuffle method provided in the homework. Thanks for
this one! -}

import System.Random
import Data.Array.IO
import Control.Monad
 
-- Randomly shuffle a list
shuffle :: [a] -> IO [a]
shuffle xs = do
        ar <- newArray n xs
        forM [1..n] $ \i -> do
            j <- randomRIO (i,n)
            vi <- readArray ar i
            vj <- readArray ar j
            writeArray ar j vi
            return vj
  where
    n = length xs
    newArray :: Int -> [a] -> IO (IOArray Int a)
    newArray n xs =  newListArray (1,n) xs