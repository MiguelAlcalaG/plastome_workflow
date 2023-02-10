#!/bin/bash

while read name; do gdown --folder $name; done < namelist.txt
