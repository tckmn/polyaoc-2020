#!/usr/bin/env runhaskell

import Data.List

conv = sum . zipWith (*) (iterate (*2) 1) . reverse . map tr
    where tr 'F' = 0
          tr 'B' = 1
          tr 'L' = 0
          tr 'R' = 1

part1 = last

part2 (a:b:xs)
  | a+2 == b  = a+1
  | otherwise = part2 (b:xs)

main = do
    input <- sort . map conv . lines <$> readFile "input"
    putStrLn . show $ part1 input
    putStrLn . show $ part2 input
