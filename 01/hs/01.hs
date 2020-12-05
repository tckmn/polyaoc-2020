#!/usr/bin/env runhaskell

import Data.List
import Data.Maybe

comb _ 0 = [[]]
comb [] _ = []
comb (x:xs) n = map (x:) (comb xs (n-1)) ++ comb xs n

go = ((product . fromJust . find ((==2020) . sum)) .) . comb

main = do
    input <- map read . lines <$> readFile "input"
    -- both parts
    mapM (putStrLn . show . go input) [2,3]
