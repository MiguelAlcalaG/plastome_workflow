#!/bin/bash


#This script renames the first line of any fasta file with the corresponding name from a list. This script works great in conjunction with bash_rename.sh
#to be able to have a consistent naming scheme on both the file and inside it.
while read name; do sed -i "s/>.*/>$name/g" plastomes/$name.fasta | grep ">" ; done < namelist_replace.txt
