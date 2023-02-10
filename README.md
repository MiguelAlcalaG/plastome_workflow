# plastome_workflow
Dumping of workflow for plastome assembly and annotation

The workflow so far has consisted of the following steps:

NOTE_1: This workflow assumes a directory structure such as the following:

General_Folder/
------id[species,identifier,etc.]/
      ------id_R1.fastq.gz
      ------id_R2.fastq.gz
------id[species,identifier,etc.]/
      ------id_R1.fastq.gz
      ------id_R2.fastq.gz
------id[species,identifier,etc.]/
      ------id_R1.fastq.gz
      ------id_R2.fastq.gz
      
NOTE_2: The workflow constantly uses an id for each directory containing the data. 
Thus, is is necessary to create a namelist of all the directories you'll be working with.
For example, namelist3.txt

---------------------

Step 1:
Data download
The data was uploaded to Google Drive. As such, it was downloaded using gdown for easy storage and manipulation
The only downside of Gdown is that it can only download folders with 50 files or less.
Thusly, folders may need to be organized and then reorganized for download.
The script used was simple, gdown.sh, which uses a namelist with the URL of the folders to download.

---------------------

Step 2:
Data cleaning
Trimmomatic was used to clean and filter the data. The script auto.pl was used, with a namelist like the one in trim_namelist.txt.
The namelist was generated using list_fq.sh, then edited in mass using regex. Then, the generated files were moved in mass to a new 
directory inside the corresponding one for each id, named trimm_[id], using mv_script_trim.sh

---------------------

Step 3:
Verify cleaning
FastQC was used to verify the files are clean. The script fastqc.sh was used for this purpose. The script if very simple, but it 
assumes the directory structure in NOTE_1 and step 2. Thus, it may be necessary to move the files accordingly. After completion, the files were moved
using mv_script_fqc.sh.
Then, a report was generated using zipextract_fastqc_script.sh and modified using regex (results.txt) to fit a .csv format, like fqc.csv.

---------------------

Step 4:
Organelle assembly
