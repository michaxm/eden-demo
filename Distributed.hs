import Control.Parallel.Eden

to :: Integer 
to = 40000

main :: IO ()
main =
  print $ toNumberLength $ foldr countNumberLen (0 :: Integer) distributedCalculationResult
  where
    countNumberLen :: Integer -> Integer -> Integer
    countNumberLen previous res = previous + (toNumberLength res)
    toNumberLength = fromIntegral . length . show
    distributedCalculationResult :: [Integer]
    distributedCalculationResult = spawn [process f3, process f5, process f7, process f13] [to, to, to, to]
    f3 = f 3
    f5 = f 5
    f7 = f 7
    f13 = f 13

f :: Integer -> Integer -> Integer
f m n = m + product [1..n]
