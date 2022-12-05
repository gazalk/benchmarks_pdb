## Benchmarking the parsing of complete PDB database with the atom count

For evaluating the performance and speed of our MAT parser we have used the whole PDB  (https://www.rcsb.org/) database. These files were downlaoded on Nov 21, 2018. A total number of 145787 files were parsed and tested.

## Comparison among programs
For comparison, we have taken following tools and programs:
* BioJulia https://biojulia.net/
* BioPerl https://bioperl.org/
* BioPython https://biopython.org
* ESBTL (Easy Structural Biology Template Library) http://esbtl.sourceforge.net
* hpdb http://hackage.haskell.org/package/hPDB
* MAT (Macromolecular Analysis Toolkit) http://mat.iitr.ac.in 
* Pymol https://pymol.org
* Victor C++ http://protein.bio.unipd.it/victor/index.php/Main_Page

The plot for time taken to parse the whole database. ![benchmarks](data/benchmarks.png) 

Considering a large number of files that were not being able to parse by ESBTL and Victor C++ library, we have made an effort to look into a few files randomly to see the errors:

## Errors
### ESBTL

* 2vp1
```
../pdb2vp1.ent, Fatal error: Cannot extract field 'charge' in 
<|HETATM 4905  O2S MES B1349     -33.957   7.728 -54.813  1.00 41.36           O-1|>
```
* 5fux
```
../pdb5fux.ent, Fatal error: Cannot extract field 'charge' in 
<|HETATM 2588 ZN    ZN A1386     -22.105 -28.075   3.014  1.00 52.96          ZN+2|>
```
* 3zhv
```
../pdb3zhv.ent, Fatal error: Cannot extract field 'charge' in 
<|HETATM25082 MG    MG A2002      -3.402  18.399 -47.244  1.00 27.31          MG+2|>
```
This lead us to believe that ESBTL throws a fatal error when it is unable to extract 'charge'. A total of 132 errors were encountered. hopefully, this can be corrected in coming updates of the software.

### Victor C++

* 1a1d
```
Segmentation fault (core dumped)
```
6hg5, 1w0s, 2aar, 2agt, 2auu, and 4kan also encountered segfaults, therefore, the exact reason for these errors are unknown.

A total of 964 errors were encountered.

### BioJulia
Only two file were not read, due to having same alternative location ID for two atoms.

* 6job
```
ERROR: LoadError: Two copies of the same atom have the same alternative location ID:
HETATM 1110 CL2  F6Q A 205     -22.801  -0.188 -27.364  0.65 35.36          CL  

HETATM 1111 CL2  F6Q A 205     -24.216   -0.76 -24.948  0.65  28.3          CL  
```
* 6joh
```
ERROR: LoadError: Two copies of the same atom having the same alternative location ID:
HETATM 1056 CL2  F7T A 206     -21.811  -1.069 -26.797  0.25 40.93          CL  

HETATM 1057 CL2  F7T A 206     -23.759  -0.377 -24.485  0.25 31.66          CL  
```
# Cite
Kalyan, Gazal, et al. "Parsers, Data Structures and Algorithms for Macromolecular Analysis Toolkit (MAT): Design and Implementation." bioRxiv (2019): 605907.
