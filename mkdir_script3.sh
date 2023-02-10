#!/bin/bash
while read name;
do mkdir Epidendrum_$name/trimm_$name/;
done < namelist3.txt
