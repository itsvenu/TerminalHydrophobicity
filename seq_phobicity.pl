#!/usr/bin/perl -w

use strict;
use warnings;
use POSIX;

open IN, $ARGV[0];
$/="\n>";
while(<IN>){
	s/>//g;
	my($id, @seq) = split(/\n/, $_);
	my $lineseq = join "", @seq;
	my $length = length($lineseq);
	my $first_half = ceil($length/2);
	my $second_half = ($length - $first_half);
	my $n_term = substr($lineseq, 0, $first_half);
	my $c_term = substr($lineseq, -$second_half);
	my $AN  = () = $n_term =~ /A/gi;                #Count how many times the hydrophobic residues are repated
	my $CN  = () = $n_term =~ /C/gi;                #in N & C terminal
	my $IN  = () = $n_term =~ /I/gi;
	my $LN  = () = $n_term =~ /L/gi;                #Hydrophobic residues are
	my $MN  = () = $n_term =~ /M/gi;                #ALA, CYS, ILE, LEU, MET, PHE, PRO, VAL, TRP
	my $FN  = () = $n_term =~ /F/gi;
	my $PN  = () = $n_term =~ /P/gi;
	my $VN  = () = $n_term =~ /V/gi;
	my $WN  = () = $n_term =~ /W/gi;
	my $n_hydro = ($AN+$CN+$IN+$LN+$MN+$FN+$PN+$VN+$WN);
	my $AC  = () = $c_term =~ /A/gi;
	my $CC  = () = $c_term =~ /C/gi;
	my $IC  = () = $c_term =~ /I/gi;
	my $LC  = () = $c_term =~ /L/gi;
	my $MC  = () = $c_term =~ /M/gi;
	my $FC  = () = $c_term =~ /F/gi;
	my $PC  = () = $c_term =~ /P/gi;
	my $VC  = () = $c_term =~ /V/gi;
	my $WC  = () = $c_term =~ /W/gi;
	my $c_hydro = ($AC+$CC+$IC+$LC+$MC+$FC+$PC+$VC+$WC);


if($n_hydro > $c_hydro){
                                                                        #Compare terminal Hydrophobicity
        print "$id : N-terminal is more hydrophobic than C-terminal\n"; #and print which is higher

}else{
        print "$id : C-terminal is more hydrophobic than N-terminal\n";
     }
}
