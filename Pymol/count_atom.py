#! /usr/bin/python
# Benchmark the parsing of a PDB file given as an argument

import sys
import time
import __main__

start = time.time()
__main__.pymol_argv = ['pymol','-qc'] # Pymol: quiet and no GUI
import pymol
pymol.finish_launching()

from pymol import cmd

pdb_filepath = sys.argv[1]
pdb_name =pdb_filepath.split('.')[0]
cmd.load(pdb_filepath,"t")
elapsed = time.time() - start
print ("%s, %f, %d" % (pdb_filepath, elapsed, cmd.count_atoms()))
