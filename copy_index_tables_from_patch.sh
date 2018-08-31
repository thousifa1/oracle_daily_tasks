#!/bin/bash
# =======================================================================
# FILENAME:  copy_index_tables_from_patch.sh
# DESCRIPTION: This is the bash script to recursively copy tables and index files in the patch folders.
# Thousif Ameer Khan
# =======================================================================
tab_list=tables.txt
index_list=index.txt
PWD=`pwd`
find $PWD -type f |grep -E "alt_tb*" > ${tab_list}
while read line
	do
		cp ${line} tables/.
 	done < ${tab_list}

find $PWD -type f |grep -E "alt_in*" > ${index_list}
while read line2
	do
		cp ${line2} index/.
done < ${index_list}
