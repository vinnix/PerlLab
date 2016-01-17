#!/bin/env perl
#
#
use strict;

my @lista1 = ("a","b");
push @lista1, "C";
push @lista1, "B";

print "Valor pontual em: 2" , $lista1[2] , "\n";


foreach my $valor (@lista1)
{
	print $valor ,"\n";
}

pop @lista1;
print "valor: ", $_ ,"\n";

foreach my $valor (@lista1)
{
	print $valor ,"\n";
}


