#!/bin/bash
while read name;
	do
	echo $name >> results.txt
	unzip -p $name/fqc_$name/$name\*_paired_fastqc.zip $name\*/summary.txt | awk '{print $1}' >> results.txt;
done < namelist3.txt
