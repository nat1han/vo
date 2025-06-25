#!/bin/bash
#PBS -N Popov_integral
#PBS -l walltime=00:02:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -o output_log.txt

cd $PBS_O_WORKDIR

if [ ! -f input.txt ]; then
  echo "Файл input.txt не знайдено!" >&2
  exit 1
fi

read xmin xmax < input.txt

ymin=0.0
ymax=3.0

g++ -o integral integral.cpp -lm

./integral "$xmin" "$xmax" "$ymin" "$ymax" | grep RESULT | awk '{print $2}' > output.txt
