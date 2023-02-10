#!/bin/bash
now=$(date +"%Y%m%d_%H%M%S")
job='gtav2cityscapes_1.0%'

mkdir -p log

# use slurm
srun --mpi=pmi2 -p $3 -n$1 --gres=gpu:$1 --ntasks-per-node=$1 --job-name=$job \
    python -u ../../train.py --config=config.yaml --seed 1 --port $2 2>&1 | tee log/log_$now.txt