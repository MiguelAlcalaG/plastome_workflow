#!/bin/bash
while read name;
do mv Epidendrum_$name/*.fq.gz Epidendrum_$name/trimm_$name/;
done < namelist3.txt
