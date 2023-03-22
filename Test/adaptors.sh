#!/bin/bash
# A bash script to extract adaptors from file_list.tsv
awk '{print $7, $8}' ~/nbaf_2018_raw_data/file_list.tsv > Test/adaptors.txt # prints column 7 & 8
tr ' ' '\t' < Test/adaptors.txt > Test/adaptors.tmp & mv Test/adaptors.tmp Test/adaptors.txt # replaces space with tab
tr '+' '\t' < Test/adaptors.txt > Test/adaptors.tmp & mv Test/adaptors.tmp Test/adaptors.txt # replaces + with tab
tail -n +2 Test/adaptors.txt > Test/adaptors.tmp & mv Test/adaptors.tmp Test/adaptors.txt # removes top line
awk '!a[$0]++' Test/adaptors.txt > Test/adaptors.tmp && mv Test/adaptors.tmp Test/adaptors.txt # removes duplicate lines
awk '{sub("$", "T", $3)}; 1' Test/adaptors.txt > Test/adaptors.tmp & mv Test/adaptors.tmp Test/adaptors.txt #Adds a T to the end of every sample name
tr ' ' '\t' < Test/adaptors.txt > Test/adaptors.tmp & mv Test/adaptors.tmp Test/adaptors.txt # replaces space with tab as previous action replaced tab with space
cat -T Test/adaptors.txt # prints file and shows Tabs as ^I
