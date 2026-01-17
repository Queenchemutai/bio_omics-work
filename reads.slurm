#!/bin/bash
#SBATCH --job-name=read_count
#SBATCH --output=read_count.out
#SBATCH --error=read_count.err
#SBATCH --time=00:05:00
#SBATCH --mem=1G

gunzip -c sample.fastq.qz | awk ' NR % 4 == 2 { count ++ } END {print count}' 
