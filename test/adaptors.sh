#!/bin/bash
# A bash script to extract adaptors from file_list.tsv
awk '{print $7, $8}' ~/nbaf_2018_raw_data/file_list.tsv > ~/hyRADmod/Test/adaptors.txt # prints column 7 & 8
tr ' ' '\t' < ~/hyRADmod/Test/adaptors.txt > ~/hyRADmod/Test/adaptors.tmp & mv ~/hyRADmod/Test/adaptors.tmp ~/hyRADmod/Test/adaptors.txt # replaces space with tab
tr '+' '\t' < ~/hyRADmod/Test/adaptors.txt > ~/hyRADmod/Test/adaptors.tmp & mv ~/hyRADmod/Test/adaptors.tmp ~/hyRADmod/Test/adaptors.txt # replaces + with tab
tail -n +2 ~/hyRADmod/Test/adaptors.txt > ~/hyRADmod/Test/adaptors.tmp & mv ~/hyRADmod/Test/adaptors.tmp ~/hyRADmod/Test/adaptors.txt # removes top line
awk '!a[$0]++' ~/hyRADmod/Test/adaptors.txt > ~/hyRADmod/Test/adaptors.tmp && mv ~/hyRADmod/Test/adaptors.tmp ~/hyRADmod/Test/adaptors.txt # removes duplicate lines
awk '{sub("$", "T", $2)}; 1' ~/hyRADmod/Test/adaptors.txt > ~/hyRADmod/Test/adaptors.tmp & mv ~/hyRADmod/Test/adaptors.tmp ~/hyRADmod/Test/adaptors.txt #Adds a T to the end of every sample name
tr ' ' '\t' < ~/hyRADmod/Test/adaptors.txt > ~/hyRADmod/Test/adaptors.tmp & mv ~/hyRADmod/Test/adaptors.tmp ~/hyRADmod/Test/adaptors.txt # replaces space with tab as previous action replaced tab with space
cat -T ~/hyRADmod/Test/adaptors.txt # prints file and shows Tabs as ^I
