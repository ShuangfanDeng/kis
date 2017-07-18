#!/usr/bin/perl
use warnings;
$raw = $ARGV[0];
open (WENJIANIN,'<',"$raw") or die " ";
chomp(@wenjians = <WENJIANIN>);
my @tmp;
$count = 0;
foreach  (@wenjians){
    chomp($_);
    if (  /\|{6}/){
         $count ++;
         $ming = "pair".$count;
         foreach $itmp (@tmp){
             open (OUT,'>>',"$ming") or die " ";
             print OUT "$itmp","\n";
         }
         @tmp = ();
    }else{
         push @tmp ,$_;         
    }
}

