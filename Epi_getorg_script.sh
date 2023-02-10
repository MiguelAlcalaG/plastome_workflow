#!/bin/bash

while read name; do get_organelle_from_reads.py -1 $name/6904-JK-2_*_S1_L005_R1_001.fastq.gz -2 $name/6904-JK-2_*_S1_L005_R2_001.fastq.gz  -o $name -R 15 -k 21,45,65,85,105 -F embplant_pt; done < namelist.txt