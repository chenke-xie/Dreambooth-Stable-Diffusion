#!/usr/bin/env bash
# 
#SBATCH --job-name regularization_images
#SBATCH --output=reg_log.txt
#SBATCH --ntasks=1
#SBATCH --time=150:00
#SBATCH --gres=gpu:1

# debug info
hostname
which python3
nvidia-smi

env

source ~/.bashrc
cd /home/stud/xiec/anaconda3/bin
source activate
conda activate ldm

cd /home/stud/xiec/workarea/Dreambooth-Stable-Diffusion
python3 scripts/stable_txt2img.py --ddim_eta 0.0 --n_samples 8 --n_iter 1 --scale 10.0 --ddim_steps 50 --ckpt /home/stud/xiec/workarea/sd-v1-4.ckpt --prompt "a photo of a cat"
