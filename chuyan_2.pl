#!/usr/bin/perl
use warnings;
$rawdata = $ARGV[0];
open(WENJIANIN,'<',"$rawdata")or die " ";
@wenjians = <WENJIANIN>;
$count = 0;
foreach $ywi (@wenjians){
    $count = $count + 1;
    print "$count\n";
    chomp($ywi);
    @yws = split/ /,$ywi;
    $wi = $yws[0];
    $wiid = $yws[1];
    $wimw = $yws[2];
    #print "$wi\n";
    if($wi =~ /\./){
         print "youyan $ywi\n";
         print "$wi\n";
         @wis = split/\./,$wi;
         print "@wis\n";
         @ns = ();
         foreach $wisi (@wis){
            $n = length($wisi);
            print "$n\n";
            push @ns,$n;
            print "@ns\n";
         }
         print "@ns\n";
         #$maximum = &max(@ns);
         sub max {
              my($max_so_far) = shift @_;
              foreach(@_){
                  if ($_ > $max_so_far){
                       $max_so_far = $_;
                  }
              }
              $max_so_far
         }
         $maximum = &max(@ns);
         print "$maximum\n";
         my $index;
         foreach (0..$#ns){
            if ($ns[$_] == $maximum){
                 $index = $_;
            }
         }
         print "$index\n";
         $truesmi = $wis[$index];
         print "$truesmi\n";
         open (CHUYANOUT,'>>',"CCR2kismiidmwqcshaichuyan_2.txt")or die " ";
         print CHUYANOUT "$truesmi"," ","$wiid"," ","$wimw","\n"; 
    }else{
         print "wuyan $ywi\n";
         open (CHUYANOUT,'>>',"CCR2kismiidmwqcshaichuyan_2.txt")or die " ";
         print CHUYANOUT "$ywi","\n";
    }

}
