#!/bin/bash
while read name;
do mkdir Epidendrum_$name/raw_$name/;
done < namelist3.txt
