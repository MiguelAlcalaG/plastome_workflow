#!/bin/bash
while read name;
do mkdir Epidendrum_$name/fqc_$name/;
done < namelist3.txt