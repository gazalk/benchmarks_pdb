# Benchmark the atom count and parsing of complete PDB database
# Gazal Kalyan

import time
from Bio.PDB import PDBParser
import glob
f=open("output.txt", "a+")


for file in glob.glob("/home/gazal/PDB-all/ftp.wwpdb.org/extracted/*.ent"):
	print ("processing %s"%file)
	parser = PDBParser()

	start = time.time()
	structure = parser.get_structure("", file)
	elapsed = time.time() - start

	atm_list = list(structure.get_atoms())
	atm_count = len(atm_list)

	f.write("%s,%d,%f\n" % (file, atm_count, elapsed))
f.close()
