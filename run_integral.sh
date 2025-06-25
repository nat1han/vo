#!/bin/bash

if [ ! -f input.txt ]; then
  echo "Файл input.txt не знайдено!"
  exit 1
fi

read xmin xmax < input.txt

ymin=0.0
ymax=3.0

g++ -o integral integral.cpp -lm

./integral "$xmin" "$xmax" "$ymin" "$ymax" | grep RESULT | awk '{print $2}' > output.txt
