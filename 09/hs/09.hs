#!/usr/bin/env runhaskell

import Data.List
import Data.Maybe

part1 input
  | val `elem` sums (take 25 input) = part1 $ tail input
  | otherwise = val
  where val = input !! 25
        sums a = [x+y | (x:xs) <- tails a, y <- xs]

part2 = part2' 0 0
    where part2' sum count input val
            | sum < val = part2' (sum + input!!count) (count+1) input val
            | sum > val = part2' (sum - head input) (count-1) (tail input) val
            | otherwise = (+) <$> minimum <*> maximum $ take count input

main = do
    input <- map read . lines <$> readFile "input"
    let val = part1 input
    putStrLn . show $ val
    putStrLn . show $ part2 input val
