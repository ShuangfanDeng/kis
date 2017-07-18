#!/usr/bin/perl
use warnings;
open(WENJIANIN,'<',"CCR2ki.txt") or die " ";
@record = ();
while($line = <WENJIANIN>){
   @lines = split/\t/,$line;
   chomp(@lines);
   $smi = $lines[10];
   $id = $lines[0];
   $mw = $lines[6];
   if(($smi ne "")and($id ne "")and($mw ne "")and($mw > 50)and($mw < 800)){  
       $l = "$smi"." "."$id"." "."$mw";
       print "$l\n";
       push @record,$l;
       # open (WZOUT,'>>',"D3kismiidmwshai_1.txt") or die " ";
       # print WZOUT "$smi"," ","$id"," ","$mw","\n"; 
    }
}      
print "@record\n";
@count = ();
@uniq = grep { ++$count{$_} < 2 } @record;
print "@uniq\n";
foreach $i (@uniq){
   open (WZOUT,'>>',"CCR2kismiidmwqcshai_1.txt") or die " ";
   print WZOUT "$i","\n";
}

