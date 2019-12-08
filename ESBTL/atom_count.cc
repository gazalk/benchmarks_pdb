// Benchmark the parsing of a PDB file given as an argument

#include <ESBTL/default.h>
#include <iostream>
#include <time.h>

int main( int argc, char* argv[] ) {
    std::string pdb_filepath = argv[1];
    std::cout << pdb_filepath << ", ";
    std::cout.setstate(std::ios_base::failbit);
    clock_t tStart = clock();
    ESBTL::PDB_line_selector sel;
    std::vector<ESBTL::Default_system> systems;
    ESBTL::All_atom_system_builder<ESBTL::Default_system> builder(systems, sel.max_nb_systems());
    ESBTL::read_a_pdb_file(pdb_filepath, sel, builder, ESBTL::Accept_none_occupancy_policy<ESBTL::PDB::Line_format<> >());
    clock_t tFinish = clock();
    std::cout.clear();
    int count_a=0;
    for (ESBTL::Default_system::Models_iterator it_model=systems[0].models_begin();
              it_model!=systems[0].models_end();
              ++it_model)
        {
          const ESBTL::Default_system::Model& model=*it_model;
          //iterate over all atoms of a model
          count_a = count_a + model.number_of_atoms();
          }
    printf("%.6f, ", (double)(tFinish - tStart)/CLOCKS_PER_SEC);
    printf("%d\n",(int)count_a);
}
