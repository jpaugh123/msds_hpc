#!/bin/bash
#SBATCH -J assignment_05
#SBATCH -o assignment_05%j.out
#SBATCH -p htc
#SBATCH -N 1
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G

printf "SLRUM_JOB_NAME is  {$SLURM_JOB_NAME}\n"
printf "SLURM_SUBMIT_HOST is {$SLURM_SUBMIT_HOST}\n"
printf "SLURM_JOB_ID is {$SLURM_JOB_ID}\n"
printf "contents of /proc/cpuinfo is : \n"
cat /proc/cpuinfo
printf "SLURM_JOB_NUM_NODES is {$SLURM_JOB_NUM_NODES}\n"
printf "SLURM_NTASKS (number of cores for the job?) i:wqs {$SLURM_NTASKS}\n"
printf "SLURM_MEM_PER_NODE is {$SLURM_MEM_PER_NODE}\n"
printf "free -g output:\n"
free -g
 
printf "Load sigularity\n"

module load singularity

printf "RUn batch job\n"

singularity run assignment_04.sif


