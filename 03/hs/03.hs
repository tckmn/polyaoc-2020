#!/usr/bin/env runhaskell

go' dy dx input =
    length . filter id $ zipWith f (every dy input) [0..]
        where f x i = cycle x !! (dx*i) == '#'
              every n [] = []
              every n xs@(x:_) = x:every n (drop n xs)

go = go' 1

main = do
    input <- lines <$> readFile "input"
    putStrLn . show $ go 3 input
    putStrLn . show $ product $ map ($ input) [go 1, go 3, go 5, go 7, go' 2 1]
