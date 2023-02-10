#!/bin/bash
##The raw files can be moved as necessary, with a script like this one.
while read name;
do mkdir Epidendrum_$name/raw_$name/;
done < namelist3.txt

while read name;
do mv Epidendrum_$name/*.fastq.gz Epidendrum_$name/raw_$name/;
done < namelist3.txt
