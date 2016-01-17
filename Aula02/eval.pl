#!/bin/env perl
#
#
use warnings;
use strict;
my $expr = 'print $c = $a + $b, "\n"';
my ($a, $b, $c) = (10, 20);
eval $expr;
print $@, "\n" if $@;
print "$a + $b = $c\n";

