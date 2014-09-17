#!/bin/env perl
#
#
#
use strict;
use warnings;

my $r = [1, 2, [10, 20]];
print "Forma 1: \${\$ref}\n";
print ’Lista interna em
my @i ${$r}[2]
print = ’,
print "${$r}[2].\n";
     = @{ ${$r}[2] };
    'A lista interna @{ ${$r}[2] }
   é ', "( @i )\n";
   'Segundo elemento ${ ${$r}[2] }[1] = ', "${ ${$r}[2] }[1].\n";
print "\n\nForma 2: \$\$ref (sem as chaves)\n";
print 'Lista interna em
my @j $$r[2]
print = ',
print "$$r[2].\n";
print = @{ $$r[2] };
     'A lista interna
    @{ $$r[2] }
   é ', "( @j )\n";
   'Segundo elemento
  ${ $$r[2] }[1] = ', "${ $$r[2] }[1].\n";
 'Também poderia ser
 $$r[2][1]
= ',
"$$r[2][1].\n";
print "\n\nForma 3: \$ref->
print 'Lista interna em
my @k = @{ $r->[2] };
print 'A lista interna
print @{
print 'Segundo elemento
     '... ou simplesmente
(troca o \$ extra por ->)\n";
$r->[2]
= ', "$r->[2].\n";
$r->[2] }
é ', "( @k )\n";
$r->[2]->[1] = ', "$r->[2]->[1].\n";
$r->[2][1]
= ', "$r->[2][1].\n";

