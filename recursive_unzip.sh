#!/bin/bash
# =======================================================================
# FILENAME:  recursive_unzip.sh
# DESCRIPTION: This is the bash script to recursively unzip folders in the folder.
# Thousif Ameer Khan
# =======================================================================

PWD=`pwd`
zip_file_list=zip_list.txt

count=0
do_get_zip_file_count()
{
	count=`find $PWD -type f |grep -E "*.zip$"|wc -l`
}

zero=0
do_get_zip_file_count
while [ $count -ne $zero ]
do

	find $PWD -type f |grep -E "*.zip$" > ${zip_file_list}
	while read line
	do
		folder_name=`echo ${line} | rev | cut -c5- | rev`
		unzip ${line} -d ${folder_name}
		rm -rf ${line}
	done < ${zip_file_list}
	do_get_zip_file_count
done

rm -r ${zip_file_list}
chmod -R 777 * 
