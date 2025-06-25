#!/bin/bash
#PBS -N Popov_integral_array
#PBS -l walltime=00:02:00
#PBS -l nodes=1:ppn=1
#PBS -t 0-3
#PBS -j oe
#PBS -o output_log_$PBS_ARRAYID.txt

cd $PBS_O_WORKDIR

line=$(sed -n "$((PBS_ARRAYID + 1))p" input.txt)
read xmin xmax ymin ymax <<< "$line"

g++ -o integral integral.cpp -lm

./integral "$xmin" "$xmax" "$ymin" "$ymax" | grep RESULT | awk '{print $2}' > output_$PBS_ARRAYID.txt
