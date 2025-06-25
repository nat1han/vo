#!/bin/bash
#PBS -N Popov_GrandTotal
#PBS -l walltime=00:02:00
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -o GT_log.txt

cd $PBS_O_WORKDIR

cat solvOut_*.out | awk 'BEGIN {sum=0} {sum += $1} END {print sum}' > GT.out
