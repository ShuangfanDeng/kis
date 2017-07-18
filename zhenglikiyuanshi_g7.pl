#!/usr/bin/perl
use warnings;
$rawdata = $ARGV[0];
open (KIYUANSHI414IN,'<',"$rawdata") or die " ";
while ($line = <KIYUANSHI414IN>){
     @lines = split/\t/,$line;
     if (($lines[10] ne "")&&($lines[0] ne "")&&($lines[16] ne "")&&($lines[28] ne "")&&($lines[29] ne "")&&($lines[42] ne "")){
         @lines42 = split/ /,$lines[42];
         $liness42 = join ":",@lines42;
         $journal = $lines[51]." ".$lines[52]." ".$lines[53]." ".$lines[54]." ".$lines[55];
         @journals = split/ /,$journal;
         $journall = join "_",@journals;

         open (ZHENGLIOUT,'>>','zhenglikiyuanshi_7.txt') or die " ";
         print ZHENGLIOUT "$lines[10]"," ","$lines[0]"," ","$lines[16]"," ","$lines[28]"," ","$lines[29]"," ","$liness42"," ","$journall","\n";
     }
}
