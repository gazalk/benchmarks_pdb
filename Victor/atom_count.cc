// Benchmark the parsing of a PDB file given as an argument

#include <PdbLoader.h>
#include <Protein.h>
#include <iostream>
#include <time.h>

using namespace Victor::Biopool;
using namespace Victor;

int main( int argc, char* argv[] ) {
    string pdb_filepath = argv[1];
    clock_t tStart = clock();
    ifstream inFile( pdb_filepath.c_str() );
/*
PdbLoader 	( 	istream &  	_input = cin,
		bool  	_permissive = false,
		bool  	_noHAtoms = false,
		bool  	_noHetAtoms = false,
		bool  	_noSecondary = false,
		bool  	_noConnection = false,
		bool  	_noWater = true,
		bool  	_verb = true,
		bool  	_allChains = false,
		string  	_NULL = "",
		bool  	_onlyMetal = false,
		bool  	_noNucleotideChains = true 
	) 	
*/
    PdbLoader pl(inFile, true, false, false, true, false, false, false, true, "", false, false);
    Protein prot;
    prot.load( pl );
    clock_t tFinish = clock();
	Spacer sp;
	sp.load(pl);
	int atom_cout=0;
	for(int i=0; i<sp.sizeAmino(); i++)
		atom_cout = atom_cout + sp.getAmino(i).size();
	printf("%s, ", pdb_filepath);
        printf("%.6f, ", (double)(tFinish - tStart)/CLOCKS_PER_SEC);
	printf("%d\n", atom_cout);
}
