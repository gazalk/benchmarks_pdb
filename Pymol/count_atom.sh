#!/bin/bash

FILES="/home/gazal/PDB-all/ftp.wwpdb.org/extracted/*.ent"
for f in $FILES
	do
		echo "processing file $f"
		python count_atom.py $f >> output.txt
	done

