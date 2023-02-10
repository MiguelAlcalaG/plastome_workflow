#!/bin/bash
while read name;
do mv Epidendrum_$name/*.fastq.gz Epidendrum_$name/raw_$name/;
done < namelist3.txt
