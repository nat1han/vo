#!/bin/bash
#PBS -N Popov_integral_array
#PBS -l walltime=00:02:00
#PBS -l nodes=1:ppn=1
#PBS -t 1-340
#PBS -j oe
#PBS -o log_array_$PBS_ARRAYID.txt

cd $PBS_O_WORKDIR

line=$(sed -n "${PBS_ARRAYID}p" input_big.txt)
read xmin xmax <<< "$line"

ymin=0.0
ymax=3.0

g++ -o integral integral.cpp -lm

./integral "$xmin" "$xmax" "$ymin" "$ymax" | grep RESULT | awk '{print $2}' > solvOut_${PBS_ARRAYID}.out
