#!/usr/bin/perl
use warnings;
foreach $wenjian(@ARGV){
   open (WENJIANIN,'<',"$wenjian") or die " ";
   @wenjians = <WENJIANIN>;
   $small = $wenjians[0];
   @smalls = split/ /,$small;   
   if (($smalls[2] >= 17.49)&&($smalls[2] <= 18.49)){
      rename "$wenjian","F"."$wenjian";
   }elsif(($smalls[2] >= 33.95)&&($smalls[2] <= 34.95)){
      rename "$wenjian","Cl"."$wenjian";
   }elsif(($smalls[2] >= 78.39)&&($smalls[2] <= 79.39)){
      rename "$wenjian","Br"."$wenjian";
   }elsif(($smalls[2] >= 125.39)&&($smalls[2] <= 126.39)){
      rename "$wenjian","I"."$wenjian";
   }else{
      rename "$wenjian","qr"."$wenjian";
   }
}
