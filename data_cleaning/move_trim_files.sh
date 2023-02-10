#!/bin/bash
while read name;
do mkdir $name/trimm_$name/;
done < namelist3.txt

while read name; do mv $name*.fq.gz $name/trimm_$name;done < namelist3.txt
