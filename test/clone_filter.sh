#!/bin/bash
#bash script to run clone_filter on Shotgun 501 703 sample

clone_filter -1 Shotgun_501_703/201002_A00291_0299_AHTGYKDRXX_1_11790BJ0003L01_1.fastq.gz \
-2 Shotgun_501_703/201002_A00291_0299_AHTGYKDRXX_1_11790BJ0003L01_2.fastq.gz \
-i 'gzfastq' \
-o ~/sample/clone_filter/ \
-D \
--oligo_len_1 4 \
--oligo_len_2 4 \
--inline_inline
