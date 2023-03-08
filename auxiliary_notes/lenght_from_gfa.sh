#!/bin/bash


## generate temporary file "namelist_gfas.txt" with the paths to every gfa file from namelist.txt
while read name; do ls $name/go_$name/embplant_pt.K*.complete.graph1.selected_graph.gfa >> namelist_gfas.txt; done < namelist.txt

## generate temporary file "namelist_names.txt" for pasting later from namelist.txt
while read name; do echo $name >> namelist_names.txt; done < namelist.txt

## generate temporary file namelist_lengths.csv from namelist_gfas.txt
while read name; 
do cat $name | awk '{print $4}' | grep "LN" | awk -F: '{print $3}' | python -c 'import sys; print(",".join(sys.stdin.read().splitlines()))' >> namelist_lengths.txt; 
done < namelist_gfas.txt

## paste both temporary files
paste -d "," namelist_names.txt namelist_lengths.txt > lengths.csv 

rm namelist_lengths.txt 
rm namelist_gfas.txt
rm namelist_names.txt