#!/usr/bin/env bash
# 
#SBATCH --job-name dreambooth-training
#SBATCH --output=dreambooth_training_log.txt
#SBATCH --ntasks=1
#SBATCH --time=150:00:00
#SBATCH --gres=gpu:1

#debug info
hostname
which python3
nvidia-smi

env

#activate env
source ~/.bashrc
cd /home/stud/xiec/anaconda3/bin
source activate
conda activate ldm

cd /home/stud/xiec/workarea/Dreambooth-Stable-Diffusion
python3 main.py --base configs/stable-diffusion/v1-finetune_unfrozen.yaml \
        --train \
        --actual_resume /home/stud/xiec/workarea/sd-v1-4.ckpt \
        --name dreambooth-training \
        --gpus 0, \
        --data_root training/cat \
        --reg_data_root outputs/txt2img-samples/samples/cat-samples \
	--logdir logdir \
        --class_word cat
