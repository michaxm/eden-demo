#!/bin/bash -e

HC=~/opt/ghc-7.8.2-eden/bin/ghc

mkdir -p build
for demo in HelloWorld Distributed; do
  echo demo: ${demo}
  ${HC} ${demo}.hs -fforce-recomp -parcp -o build/${demo} -odir build -hidir build 
  time build/${demo} +RTS -N1
  time build/${demo} +RTS -N4
done
