#!/bin/bash
## Used to get rid of spaces in the name of the files which were there during download
while read name;do mv Epidendrum\ $name Epidendrum_$name; done < namelist3.txt
