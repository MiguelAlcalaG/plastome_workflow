#!/bin/bash
while read name;
do mv Epidendrum_$name/*.zip Epidendrum_$name/fqc_$name/;
done < namelist3.txt
