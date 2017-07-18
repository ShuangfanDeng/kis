#!/usr/bin/perl
use warnings;
foreach $wenjian (@ARGV){
   print "this is $wenjian\n";
   open (WENJIANIN,'<',"$wenjian") or die " ";
   chomp(@wenjians = <WENJIANIN>);
   chomp($ssmiidmwd = $wenjians[0]);
   chomp($spki = $wenjians[1]);
   chomp($bsmiidmwd = $wenjians[2]);
   chomp($bpki = $wenjians[3]);
   chomp($deltapki = $wenjians[4]);
   chomp($assayid = $wenjians[5]);
   chomp($assay = $wenjians[6]);
   @deltapkis = split/ /,$deltapki;
   @upzerochazhis = grep { $_ > 1} @deltapkis;
   if ( @upzerochazhis > 0){
          $ming = "up1".$wenjian;
          open (UPZOUT,'>',"$ming") or die " "; 
          print UPZOUT "$ssmiidmwd","\n","$spki","\n","$bsmiidmwd","\n","$bpki","\n","$deltapki","\n","$assayid","\n","$assay","\n","up1","\n";
          print "up 1\n";
   }else{
          print "not up 1\n";
   }
}


