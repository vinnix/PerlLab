#!/bin/env perl
#
#
use warnings;
use strict;

my $teste = "OK DENOVO";

&passaparam(50,"ok","meu_teste",$teste);

sub passaparam {
   # my ($v_num, $status, $texto, $var)  = @_;
  
   my $v_num = shift;
   my $status = shift;
   my $texto = shift;
   my $var = shift;

   print "Status:", $status, "\n";
   print "Num:" , $v_num, "\n";
   print "Texto:", $texto, "\n";
   print "Var:", $var , "\n";
}
