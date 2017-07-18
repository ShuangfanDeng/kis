#!/usr/bin/perl
use warnings;
$rawdata = $ARGV[0];
open(WENJIANIN,'<',"$rawdata") or die " ";
@wenjians = <WENJIANIN>;
close WENJIANIN; 
$count = 0;
foreach $wi (@wenjians){
   $count = $count + 1;
   print "$count\n";
   chomp($wi);
   @wis = split/ /,$wi;
   chomp($smi = $wis[0]);
   chomp($id = $wis[1]);
   chomp($mw = $wis[2]);
   print "$smi\n";

   open (SMIOUT,'>',"i.smi")or die " ";
   print SMIOUT "$smi";
   close SMIOUT;

   `~/SUBSET_1.0/CACTVS/get_screen_addH.tcl "i.smi" > "i.fp"`;
   open (FPIN,'<',"i.fp")or die " ";
   $fp = <FPIN>;
   chomp($fp);
   close FPIN;
   print "$fp\n";

   @fps = split/\t/,$fp;
   chomp($atomnum = $fps[0]);
   chomp($ifp = $fps[1]);

   open (SMIIDANFPOUT,'>>',"CCR2kismiidmwcyanfp_3.txt")or die " ";
   print SMIIDANFPOUT "$smi"," ","$id"," ","$mw"," ","$atomnum"," ","$ifp","\n";
   close SMIIDANFPOUT;
   print "$smi"," ","$id"," ","$mw"," ","$atomnum"," ","$ifp","\n";

   @wis = ();
   $smi = undef;
   $id = undef;
   $mw = undef;
   $fp = undef;
   @fps = ();
   $atomnum = undef;
   $ifp = undef;
   `rm "i.smi"`;
   `rm "i.fp"`;

}
