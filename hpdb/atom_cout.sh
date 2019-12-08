#!/bin/bash

FILES="/home/gazal/PDB-all/ftp.wwpdb.org/extracted/*.ent"
for f in $FILES
	do
		echo "processing file $f"
		echo "$f" >> hpdb_output.txt
		echo "\"*\"" >> hpdb_output.txt
		./gazal $f &>> hpdb_output.txt
	done
