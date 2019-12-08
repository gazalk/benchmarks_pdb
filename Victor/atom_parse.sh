#!/bin/bash

FILES="/home/gazal/PDB-all/ftp.wwpdb.org/extracted/*.ent"
for f in $FILES
	do
		echo "processing file $f"
		./gazal_atom_count $f >> output.txt
		retval=$?
		if [ $retval -ne 0 ]; then
			echo "$f, error" >> output.txt
		fi
	done
