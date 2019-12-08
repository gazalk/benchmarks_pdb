#!/bin/bash

FILES="/home/gazal/PDB-all/ftp.wwpdb.org/extracted/*.ent"
for f in $FILES
	do
		echo "processing file $f"
		./atom_count $f >> output.txt
	done
