#!/bin/env perl
#
#
use warnings;
use strict;
use libs::Pack::teste;

my $var = "texto";
$var =~ /^t(.*)to/;
my $a = \1;
my $b = [ ];
my $c = { };
my $d = \$c;
print '$a é uma referência para ', ref $a,"\n";
print '$b é uma referência para ', ref $b,"\n";
print '$c é uma referência para ', ref $c,"\n";
print '$d é uma referência para ', ref $d,"\n";

bless($c, "libs::Pack::teste");

print '$c é uma referência para ', ref $c,"\n";





