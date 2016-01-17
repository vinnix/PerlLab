#!/bin/env perl
#
#
use strict;
use warnings;

my $a = "texto texto teste";
my $r = $a =~ s/texto/linha/g;
unless ($r) {print "Não encontrei\n"};
print $r , "\n";

