# Benchmark the atom count and parsing of complete PDB database
# Gazal Kalyan

use Bio::Structure::IO;
use Time::HiRes qw(time);
use strict;
use warnings;

my @pdb_files = glob("/home/gazal/PDB-all/ftp.wwpdb.org/extracted/*.ent");
my $pdb_file;
my $struc;
my $fh;

sub  count_atoms {
    my $c = 0;
    for my $chain ( $struc->get_chains) {
        for my $res ($struc->get_residues($chain)) {
            my $atms = $struc->get_atoms($res);
            $c = $c+$atms;
        }
    }
    return $c;
}

open($fh, '>', "output.txt") or die "Cannot open output.txt: $!";
foreach $pdb_file (@pdb_files) {
	my $start = time();
	my $structio = Bio::Structure::IO->new(-file => $pdb_file);
	print "processing file $pdb_file \n";
	$struc = $structio->next_structure;
	my $end = time();
	my $total_t =$end - $start;
	my $c_out = count_atoms();
	print $fh "$pdb_file,$c_out,$total_t\n";
}
close $fh;
