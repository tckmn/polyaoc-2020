#!/usr/bin/env runhaskell

parse :: String -> (Int, Int, Char, String)
parse line =
    (read a, read $ drop 1 b, head ch, pwd)
        where [rng, ch, pwd] = words line
              (a, b) = span (/='-') rng

part1 = length . filter part1'
    where part1' (a, b, ch, pwd) = between a b $ length $ filter (==ch) pwd
          between a b c = a <= c && c <= b

part2 = length . filter part2'
    where part2' (a, b, ch, pwd) = (pwd !! pred a == ch) /= (pwd !! pred b == ch)

main = do
    input <- map parse . lines <$> readFile "input"
    putStrLn . show $ part1 input
    putStrLn . show $ part2 input
