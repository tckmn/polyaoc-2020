#!/usr/bin/env runhaskell

import Data.List

go [] _ = 0
go xs f = length (foldl1 f vals) + go (drop 1 rest) f
    where (vals, rest) = break null xs

main = do
    input <- lines <$> readFile "input"
    putStrLn . show $ map (go input) [union, intersect]
