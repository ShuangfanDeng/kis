#!/usr/bin/perl
use warnings;
$rawdata = $ARGV[0];
open (WENJIANIN,'<',"$rawdata")or die " ";
@wenjians = <WENJIANIN>;
foreach $line (@wenjians){
   chomp($line);
   $index ++;
   print ">>>>> Processing $index/$#wenjians .....\n";
   @wis = split/ /,$line;
   `echo "$wis[0]" > tmp.smi`;
   
   if($wis[0] =~ /F|Cl|Br|I/){
      print "$wis[0]\n";
      foreach $mol (@wenjians) {
         chomp($mol);
         @tmp = split/ /,$mol;
         print "$tmp[0]\n";

         $bigfpjh = $wis[4];
         $smallfpjh = $tmp[4];
         @bigfp = split//,$bigfpjh;
         @smallfp = split//,$smallfpjh;
         print "@bigfp\n";
         print "@smallfp\n";
        
         $bigatomandnum = $wis[3];
         $smallatomandnum = $tmp[3];
         if($bigatomandnum =~ /\A(C)([0-9]+?)(H)([0-9]+)([A-Z]+?)/){
            $bigcn = $2;
            $bighn = $4;
         }
         if($smallatomandnum =~ /\A(C)([0-9]+?)(H)([0-9]+)([A-Z]+?)/){
            $smallcn = $2;
            $smallhn = $4;
         }
         print "$bigatomandnum  $bigcn  $bighn\n";
         print "$smallatomandnum  $smallcn  $smallhn\n";
            
         $bigmw = $wis[2];
         $smallmw = $tmp[2];
         print "$bigmw  $smallmw\n";
        
         $bigid = $wis[1];
         $smallid = $tmp[1];
         $bigsmi = $wis[0];
         $smallsmi = $tmp[0];
         print "$bigid $bigsmi $smallid $smallsmi\n";

         @sz = ();
         foreach(0..$#bigfp){
            $sb = $bigfp[$_] - $smallfp[$_];
            if($sb != 0){push @sz ,$_ ;}
         }
         print "@sz\n";
    
         my $flag = 0;
         @A = @sz;
         @B = (4..22,26..36,41,42,49..282,284,285,286,288..293,295,296,300..307,309..317,319,321,322,324,326);
         for( my $i = 0; $i < @A; $i++ ){
            for( my $j = 0; $j < @B; $j++ ){
               if( $B[$j] eq $A[$i] ){
                  $flag++;
                  last;
               }
            }
         }
         print "$flag\n";
        
         if($flag == 0 ){
             print "Figerprint >>>>>>>>>Matched found between $bigid and $smallid:{@sz}\n";
             if($smallhn == $bighn + 1 and $bigcn == $smallcn){
                print "Cn eq and Hn + 1\n";
                $mwdelta = $bigmw - $smallmw;
                if(($mwdelta > 17.8 and $mwdelta < 18.2) or ($mwdelta > 34.25 and $mwdelta < 34.65) or ($mwdelta > 78.7 and $mwdelta < 79.1) or ($mwdelta > 125.7 and $mwdelta < 126.1)){
                   print "molweight delta match F and Cl and Br and I.\n";
                   @ck = `/pubhome/sdeng/ChemAxon/JChem/bin/jcsearch -q "$tmp[0]" -f smiles tmp.smi`;
                   if(@ck == 1){
                      open (PAIROUT,'>>','CCR2KIpair.txt') or die " ";
                      print PAIROUT "$bigsmi"," ","$bigid","\n","$smallsmi"," ","$smallid"," ","$mwdelta","\n","||||||","\n";
                      print "JCSEARCH >>>>>>>>>Matched found between $bigid and $smallid: $mwdelta\n";
                  }
               }
            } 
         }else{print "NNNNNNO Figerprint >>>>>>Matched found between $bigid and $smallid:{@sz}\n";}



      }  
   }
}


