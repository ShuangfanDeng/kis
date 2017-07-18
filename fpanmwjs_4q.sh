#$ -S /bin/sh
#$ -cwd
#$ -o fpanmwjs_4q.log
#$ -e fpanmwjs_4q.err
#$ -j y
#$ -r y
#$ -t 1-1

date
hostname


perl fpanmwjs_4.pl CCR2kismiidmwcyanfp_3.txt
