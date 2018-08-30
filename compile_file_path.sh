#!/bin/bash
# =======================================================================
# FILENAME:  compile_file_path.sh
# DESCRIPTION: This is the bash script to get the path of the plb file from the installer zip file.
# The input should be names of plb files: example as follows
#######################################
		#ACOCON_EN_121_02
		#ACOCON_EN_112_01
		#ACCINS_EL_112_01
		#UPRPRC_JW_100_02
########################################
# Thousif Ameer Khan
# =======================================================================

INPUT_FILE=input_file.txt
OUTPUT_FILE=output_file.txt
while read line
do
	plb_file_name=${line}.plb
	find . -iname ${plb_file_name}  -print | tr "\134" "\057" | awk -F'/' '{print NF " @" $0}' | sort -n | awk '{print "prompt " $2 "\n" $2}' > ${OUTPUT_FILE}
done < ${INPUT_FILE}
