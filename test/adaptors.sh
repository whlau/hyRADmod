#!/bin/bash
# A bash script to extract adaptors from file_list.tsv
awk '{print $7, $8}' ~/nbaf_2018_raw_data/file_list.tsv > ~/hyRADmod/test/adaptors.txt # prints column 7 & 8
tr ' ' '\t' < ~/hyRADmod/test/adaptors.txt > ~/hyRADmod/test/adaptors.tmp & mv ~/hyRADmod/test/adaptors.tmp ~/hyRADmod/test/adaptors.txt # replaces space with tab
tr '+' '\t' < ~/hyRADmod/test/adaptors.txt > ~/hyRADmod/test/adaptors.tmp & mv ~/hyRADmod/test/adaptors.tmp ~/hyRADmod/test/adaptors.txt # replaces + with tab
tail -n +2 ~/hyRADmod/test/adaptors.txt > ~/hyRADmod/test/adaptors.tmp & mv ~/hyRADmod/test/adaptors.tmp ~/hyRADmod/test/adaptors.txt # removes top line
awk '!a[$0]++' ~/hyRADmod/test/adaptors.txt > ~/hyRADmod/test/adaptors.tmp && mv ~/hyRADmod/test/adaptors.tmp ~/hyRADmod/test/adaptors.txt # removes duplicate lines
awk '{sub("$", "T", $2)}; 1' ~/hyRADmod/test/adaptors.txt > ~/hyRADmod/test/adaptors.tmp & mv ~/hyRADmod/test/adaptors.tmp ~/hyRADmod/test/adaptors.txt #Adds a T to the end of every sample name
tr ' ' '\t' < ~/hyRADmod/test/adaptors.txt > ~/hyRADmod/test/adaptors.tmp & mv ~/hyRADmod/test/adaptors.tmp ~/hyRADmod/test/adaptors.txt # replaces space with tab as previous action replaced tab with space
cat -T ~/hyRADmod/test/adaptors.txt # prints file and shows Tabs as ^I
