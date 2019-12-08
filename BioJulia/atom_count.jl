# Benchmark the atom count and parsing of complete PDB database
# Gazal Kalyan

using Bio.Structure
using Glob
global elapsed
global pdb_filepath
global count
global fh = open("output.txt", "a")


for pdb_filepath in glob("*.ent","/home/gazal/PDB-all/ftp.wwpdb.org/extracted/")	
	try	
		read(pdb_filepath, PDB)
		elasped = @elapsed struc = read(pdb_filepath, PDB)
		count = countatoms(struc)
		write(fh, "$pdb_filepath,$count,$elasped\n")
		println("$pdb_filepath,$count,$elasped")
	catch y
		println("$pdb_filepath,error,error")
		write(fh, "$pdb_filepath,error,error\n")
	end
end
close(fh)
println("done for now")
