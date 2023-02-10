#!/bin/bash
while read name;
	do
	echo $name >> results.txt
	unzip -p Epidendrum_$name/fqc_$name/Epidendrum_$name\*_paired_fastqc.zip Epidendrum_$name\*/summary.txt | awk '{print $1}' >> results.txt;
done < namelist3.txt
