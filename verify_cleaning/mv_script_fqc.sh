#!/bin/bash
#!/bin/bash
while read name;
do mkdir $name/fqc_$name/;
done < namelist3.txt

while read name;
do mv $name/*.zip $name/fqc_$name/;
done < namelist3.txt
