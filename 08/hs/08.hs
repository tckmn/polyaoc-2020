#!/usr/bin/env runhaskell

import Control.Arrow
import Data.List
import Data.Maybe

a !!! n = head' $ drop n a
    where head' [] = Nothing
          head' (x:_) = Just x

data Instr = Acc | Jmp | Nop
parse = (readIns *** readNum) . break (==' ')
    where readIns "acc" = Acc
          readIns "jmp" = Jmp
          readIns "nop" = Nop
          readNum (' ':'+':n) = read n
          readNum (' ':'-':n) = -read n

data Result = Looped | Oob Int deriving Eq
run = run' 0 0 . flip zip (repeat False)
    where run' ip acc code = case code !!! ip of
                               Nothing -> (Oob ip, acc)
                               Just (_, True) -> (Looped, acc)
                               Just ((Acc, n), _) -> run' (ip+1) (acc+n) $ hit ip code
                               Just ((Jmp, n), _) -> run' (ip+n) acc     $ hit ip code
                               Just ((Nop, n), _) -> run' (ip+1) acc     $ hit ip code
          hit 0 ((x,_):code) = (x, True):code
          hit n (x:code) = x:hit (n-1) code

runSwap :: [(Instr, Int)] -> Int -> Maybe (Result, Int)
runSwap = ((fmap run) .) . swap
    where swap ((Acc, n):code) 0 = Nothing
          swap ((Jmp, n):code) 0 = Just ((Nop, n):code)
          swap ((Nop, n):code) 0 = Just ((Jmp, n):code)
          swap (x:code) n = (x:) <$> swap code (n-1)

main = do
    code <- map parse . lines <$> readFile "input"
    putStrLn . show . snd $ run code
    putStrLn . show . snd . fromJust . find ((== Oob (length code)) . fst) $
        mapMaybe (runSwap code) [0..]
