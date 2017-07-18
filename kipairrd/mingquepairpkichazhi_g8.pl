#!/usr/bin/perl
use warnings;
foreach $wenjian (@ARGV){
    open (WENJIANIN,'<',"$wenjian") or die " ";
    @wenjians = <WENJIANIN>;
    $smallsmiid = $wenjians[1];
    chomp($smallsmiid);
    @smallsmiids = split/ /,$smallsmiid;
    $bigsmiid = $wenjians[0];
    chomp($bigsmiid);
    @bigsmiids = split/ /,$bigsmiid;
    open (ZLKIYSIN,'<',"zhenglikiyuanshi_7.txt") or die " ";
    @zlkiys = <ZLKIYSIN>;
    @biglines = (); 
    foreach $line1 (@zlkiys){
          chomp($line1);
          @line1s = split/ /,$line1;
          if ($line1s[1] eq $bigsmiids[1]){
                 print "$line1\n";
                 push @biglines,$line1;
           
          }
          
    }
    print "@biglines\n";
    @smalllines = ();
    foreach $line2 (@zlkiys){
          chomp($line2);
          @line2s = split/ /,$line2;
          if ($line2s[1] eq $smallsmiids[1]){
                print "$line2\n"; 
                push @smalllines,$line2;
            
          }
          
    }
    print "@smalllines\n";
    
    @bigki = ();
    @smallki = ();
    @assay = ();
    @journal = ();
    foreach $bline (@biglines){
            @blines = split/ /,$bline;
            foreach $sline (@smalllines){
                    @slines = split/ /,$sline;
                    if(($blines[4] eq $slines[4])&&($blines[5] eq $slines[5])){ 
                          if ($blines[3] eq $slines[3]){
                                push @assay,$blines[3];
                                push @journal,$blines[6];
                                push @bigki,$blines[2];
                                push @smallki,$slines[2];               
                          }else{
                                $xinming = "daishoudong".$wenjian;
                                open (DAISHOUDONGOUT,'>',"$xinming") or die " ";
                                print DAISHOUDONGOUT "$smallsmiid","\n","$bigsmiid","\n";
                          }
                      
                    }
            }
    }
    print "@bigki\n";
    print "@smallki\n";   
    
    $shuzugeshu = @bigki;
    $jianyi = $shuzugeshu - 1;
    @chazhis = ();   
    foreach (0..$jianyi){
            $chazhi = $bigki[$_] - $smallki[$_] ;
            push @chazhis,$chazhi;
    }
    print "@chazhis\n";

    if (@chazhis > 0){
       $ming = "mqcz".$wenjian;
       open (CHAZHIOUT,'>',"$ming") or die " ";
       print CHAZHIOUT "$smallsmiid","\n","@smallki","\n","$bigsmiid","\n","@bigki","\n","@chazhis","\n","@assay","\n","@journal","\n"; 
    }
}


