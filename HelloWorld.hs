import Control.Parallel.Eden

main :: IO ()
main = putStrLn $ runPA $ instantiateAt 0 (process f) "hello" -- or more "edenish": f $# "hello"

f :: String -> String
f = (++ " world")
