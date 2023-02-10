#!/bin/bash
declare -a array=($(cat list_ids.txt | tr '\n' ' '))
declare -a array2=($(cat namelist3.txt | tr '\n' ' '))

#rename fqc files
for i in "${!array[@]}";
	do rename -d s/Epidendrum_${array2[i]}/${array[i]}/ Epidendrum_${array2[i]}/fqc_${array2[i]}/Epidendrum_${array2[i]}*
done

#rename trim files
for i in "${!array[@]}";
	do rename -d s/Epidendrum_${array2[i]}/${array[i]}/ Epidendrum_${array2[i]}/trimm_${array2[i]}/Epidendrum_${array2[i]}*
done

#rename fqc directory
for i in "${!array[@]}";
	do rename -d s/Epidendrum_${array2[i]}/${array[i]}/ Epidendrum_${array2[i]}/fqc_${array2[i]}/
done
#rename trim directory
for i in "${!array[@]}";
	do rename -d s/Epidendrum_${array2[i]}/${array[i]}/ Epidendrum_${array2[i]}/trimm_${array2[i]}/
done

#rename raw directory
for i in "${!array[@]}";
	do rename -d s/Epidendrum_${array2[i]}/${array[i]}/ Epidendrum_${array2[i]}/raw_${array2[i]}/
done

#rename master directory
for i in "${!array[@]}";
	do rename s/Epidendrum_${array2[i]}/${array[i]}/ Epidendrum_${array2[i]}/
done

#in case something doesn't work, declare the 2 variables at the terminal and modify this command to rename 
for i in "${!array[@]}";
	do rename s/fqc_${array2[i]}/fqc_${array[i]}/ ${array[i]}/fqc_${array2[i]}/
done