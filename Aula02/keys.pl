#!/bin/env perl
#
#
use warnings;

%local = (Fulano   => "São Paulo",
	  Beltrano => "Rio de Janeiro",
	  Ciclano  => "Belo Horizonte");

foreach (keys %local) 
{
	print "$_ mora em $local{$_}.\n";
}

%local = reverse %local;     # apenas hashes simples, como estes

print "\nAgora ordenado.....\n\n";
foreach $chave (sort keys %local) 
{
	print "Em $chave mora $local{$chave}.\n";
	print "Em $chave mora $local{$chave}.\n";
}

