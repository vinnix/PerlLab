#!/bin/env perl
#
#
use warnings;
use strict;

my @beatles = qw/John Paul George Ringo/;
my $b_ref   = \@beatles;
print "Até 80: @beatles\n";
shift @{$b_ref}; # === shift @beatles;

print "Depois de 80: @beatles\n";
