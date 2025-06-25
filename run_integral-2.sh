#!/bin/bash
#PBS -N Popov_integral                   # Назва завдання
#PBS -l walltime=00:02:00                # Час виконання: 2 хвилини
#PBS -l nodes=1:ppn=1                    # 1 вузол, 1 процесорне ядро
#PBS -j oe                               # Об'єднати stdout і stderr
#PBS -o output_log.txt                   # Файл для виводу логів

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
